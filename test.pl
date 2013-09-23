#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: test.pl
#
#        USAGE: ./test.pl  
#
#  DESCRIPTION: 
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: wba (wolf), wbiker@gmx.at
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 22/09/13 19:27:08
#     REVISION: ---
#===============================================================================

use Modern::Perl;
use utf8;
use Data::Dumper;

use FindBin qw($Bin);
use lib "$Bin/lib";

use UpdateChecker::Websides::SlashDot;

my $web = UpdateChecker::Websides::SlashDot->new;


my $result = $web->get_new_data;
print Dumper \$result;

say "yeah";
