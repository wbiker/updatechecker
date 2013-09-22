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

use FindBin qw($Bin);
use lib "$Bin/lib";

use UpdateChecker::Websides;

my $web = UpdateChecker::Websides->new;

say "yeah";
