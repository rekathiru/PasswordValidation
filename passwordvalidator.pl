#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

#my $string = "asd^&*J8i#1Yjk5Iytysd%`";
my $password = $ARGV[0];
my $length = length($password);

#Passwords must be at least 8 characters long.
#Between 8-11: requires mixed case letters, numbers and symbols
#Between 12-15: requires mixed case letters and numbers
#Between 16-19: requires mixed case letters
#20+: any characters desired

my $validPassword = validatePassword($password);
if($validPassword) {
    print "Password validation Passed for the password: [".$password."]\n";
} else {
    print "Password validation Failed for the password: [".$password."]\n";
}

sub validatePassword {
     my ($text) = @_;
     my $length = length($text);
     my $subpart;
     my $subpartlen;
     if($length < 8) {
        print "Password must be atleast 8 characters long.!\n";
        return "";
    }
    if($length >= 8) {
      $subpartlen = 4;
      if($length <= 11) {
        $subpartlen = $length-7;
      }
      $subpart = substr($text, 7, $subpartlen);
      my $regex = $subpart =~ /^[a-zA-Z0-9\@#\$\%^&*()_+\-=\[\]{};':"\\|,.<>\/?]{$subpartlen}$/;
      
      if( not $regex) {
        print "Please enter password only with mixed cases, numbers and symbols in [8-11] length range, but found ".$subpart."\n";
        return "";
      } else {
        #print "subpart is[8-11]: ".$subpart." subpart length is: ".$subpartlen." validation: ".$regex."\n";
        if($length <= 11) {
          return 1;
        }
      }
    }
   
    if($length >= 12) {
      $subpartlen = 4;
      if($length <= 15) {
        $subpartlen = $length-11;
      }
      $subpart = substr($text, 11, $subpartlen);
      my $regex = $subpart =~ /^[a-zA-Z0-9]{$subpartlen}$/;
     
      if( not $regex) {
        print "Please enter password only with mixed cases and numbers in [12-15] length range, but found ".$subpart."\n";
        return "";
      } else {
        #print "subpart is[12-15]: ".$subpart." subpart length is: ".$subpartlen." validation: ".$regex."\n";
        if($length <= 15) {
          return 1;
        }
      }
    }
   
    if($length >= 16) {
      $subpartlen = 4;
      if($length <= 19) {
        $subpartlen = $length-15;
      }
      $subpart = substr($text, 15, $subpartlen);
      my $regex = $subpart =~ /^[a-zA-Z]{$subpartlen}$/;
     
      if( not $regex) {
        print "Please enter password only with mixed cases in [16-19] length range, but found ".$subpart."\n";
        return "";
      } else {
        #print "subpart is[16-19]: ".$subpart." subpart length is: ".$subpartlen." validation: ".$regex."\n";
        if($length <= 19) {
          return 1;
        }
      }
    }
   
    if($length >= 20) {
      $subpartlen = $length-19;
      $subpart = substr($text, 19, $subpartlen);
      my $regex = $subpart =~ /^.{$subpartlen}$/;
     
      if( not $regex) {
        print "Please enter password with any characters from length 20 onwards, , but found ".$subpart."\n";
        return "";
      } else {
        #print "subpart is[>20]: ".$subpart." subpart length is: ".$subpartlen." validation: ".$regex."\n";
        return 1;
      }

    }
    
    return "";
}

