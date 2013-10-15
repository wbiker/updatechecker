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
use XML::RSS;

use FindBin qw($Bin);
use lib "$Bin/lib";

use UpdateChecker::Websides::SlashDot;
use UpdateChecker::Websides::PerlBlog;

my $web = UpdateChecker::Websides::SlashDot->new;

my @result = $web->get_new_data();

my $perl_blog = UpdateChecker::Websides::PerlBlog->new;
my @titles    = $perl_blog->get_new_data();

my $rss = XML::RSS->new( version => '2.0' );
$rss->channel(
    title         => 'Wolfs Update Channel',
    link          => 'wbiker.dyndns.org',
    description   => 'My favorits websides without RSS',
    pubDate       => 'Thu, 26 Sep 2013 19:39:46 GMT',
    lastBuildDate => 'Thu, 26 Sep 2013 19:39:46 GMT',
);

for my $slash (@result) {
    $rss->add_item(
        title       => $slash->{head},
        description => $slash->{body},
        link        => '',
    );
}

for my $perl (@titles) {
    $rss->add_item(
        title       => $perl->{head},
        description => $perl->{body},
        link        => '',
    );
}

$rss->save('rss.rdf');
