#!/usr/bin/perl
use strict;
$| = 1;

my %DataType = (
"TINYINT"=>1, "SMALLINT"=>2, "MEDIUMINT"=>3, "INT"=>4, "INTEGER"=>4, "BIGINT"=>8,
"FLOAT"=>'$M<=24?4:8', "DOUBLE"=>8,
"DECIMAL"=>'int(($M-$D)/9)*4+int(((($M-$D)%9)+1)/2)+int($D/9)*4+int((($D%9)+1)/2)',
"NUMERIC"=>'int(($M-$D)/9)*4+int(((($M-$D)%9)+1)/2)+int($D/9)*4+int((($D%9)+1)/2)',
"BIT"=>'($M+7)>>3',
"DATE"=>3, "TIME"=>3, "DATETIME"=>8, "TIMESTAMP"=>4, "YEAR"=>1,
"BINARY"=>'$M',"CHAR"=>'$M*$CL',
"VARBINARY"=>'$M+($M>255?2:1)', "VARCHAR"=>'$M*$CL+($M>255?2:1)',
"ENUM"=>'$M>255?2:1', "SET"=>'($M+7)>>3',
"TINYBLOB"=>9, "TINYTEXT"=>9,
"BLOB"=>10, "TEXT"=>10,
"MEDIUMBLOB"=>11, "MEDIUMTEXT"=>11,
"LONGBLOB"=>12, "LONGTEXT"=>12
);

my %DataTypeMin = (
"VARBINARY"=>'($M>255?2:1)', "VARCHAR"=>'($M>255?2:1)'
);

my ($D, $M, $S, $C, $L, $dt, $dp ,$bc, $CL);
my $fieldCount = 0;
my $byteCount = 0;
my $byteCountMin = 0;
my @fields = ();
my $fieldName;
my $tableName;
my $defaultDbCL = 1;
my $defaultTableCL = 1;
my %charsetMaxLen;
my %collationMaxLen;

open (CHARSETS, "mysql -B --skip-column-names information_schema -p  -e 'select CHARACTER_SET_NAME,MAXLEN from CHARACTER_SETS;' |");
%charsetMaxLen = map ( ( /^(\w+)/ => /(\d+)$/ ), <CHARSETS>);
close CHARSETS;

open (COLLATIONS, "mysql -B --skip-column-names information_schema -p -e 'select COLLATION_NAME,MAXLEN from CHARACTER_SETS INNER JOIN COLLATIONS USING(CHARACTER_SET_NAME);' |");
%collationMaxLen = map ( ( /^(\w+)/ => /(\d+)$/ ), <COLLATIONS>);
close COLLATIONS;

open (TABLEINFO, "mysqldump -d -p --compact ".join(" ",@ARGV)." |");

while (<TABLEINFO>) {
 chomp;
 if ( ($S,$C) = /create database.*?`([^`]+)`.*default\scharacter\sset\s+(\w+)/i ) {
 $defaultDbCL = exists $charsetMaxLen{$C} ? $charsetMaxLen{$C} : 1;
 print "Database: $S".($C?" DEFAULT":"").($C?" CHARSET $C":"")." (bytes per char: $defaultDbCL)\n\n";
 next;
 }
 if ( /^create table\s+`([^`]+)`.*/i ) {
 $tableName = $1;
 @fields = ();
 next;
 }
 if ( $tableName && (($C,$L) = /^\)(?:.*?default\scharset=(\w+))?(?:.*?collate=(\w+))?/i) ) {
 $defaultTableCL = exists $charsetMaxLen{$C} ? $charsetMaxLen{$C} : (exists $collationMaxLen{$L} ? $collationMaxLen{$L} : $defaultDbCL);
 print "Table: $tableName".($C||$L?" DEFAULT":"").($C?" CHARSET $C":"").($L?" COLLATION $L":"")." (bytes per char: $defaultTableCL)\n";
 $tableName = "";
 $fieldCount = 0;
 $byteCount = 0;
 $byteCountMin = 0;
 while ($_ = shift @fields) {
 if ( ($fieldName,$dt,$dp,$M,$D,$S,$C,$L) = /\s\s`([^`]+)`\s+([a-z]+)(\((\d+)(?:,(\d+))?\)|\((.*)\))?(?:.*?character\sset\s+(\w+))?(?:.*?collate\s+(\w+))?/i ) {
 $dt = uc $dt;
 if (exists $DataType{$dt}) {
 if (length $S) {
 $M = ($S =~ s/(\'.*?\'(?!\')(?=,|$))/$1/g);
 $dp = "($M : $S)"
 }
 $D = 0 if !$D;
 $CL = exists $charsetMaxLen{$C} ? $charsetMaxLen{$C} : (exists $collationMaxLen{$L} ? $collationMaxLen{$L} : $defaultTableCL);
 $bc = eval($DataType{$dt});
 $byteCount += $bc;
 $byteCountMin += exists $DataTypeMin{$dt} ? $DataTypeMin{$dt} : $bc;
 } else {
 $bc = "??";
 }
 $fieldName.="\t" if length($fieldName) < 8;
 print "bytes:\t".$bc."\t$fieldName\t$dt$dp".($C?" $C":"").($L?" COLL $L":"")."\n";
 ++$fieldCount;
 }
 }
 print "total:\t$byteCount".($byteCountMin!=$byteCount?"\tleast: $byteCountMin":"\t\t")."\tcolumns: $fieldCount\n\n";
 next;
 }
 push @fields, $_;
}
close TABLEINFO;
