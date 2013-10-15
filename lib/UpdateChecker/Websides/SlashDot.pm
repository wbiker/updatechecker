#
#===============================================================================
#
#         FILE: SlashDot.pm
#
#  DESCRIPTION: This encapsulate the update chekcing of the slash dot webside.
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: wba (wolf), wbiker@gmx.at
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 22/09/13 19:40:37
#     REVISION: ---
#===============================================================================

package UpdateChecker::Websides::SlashDot;

use Modern::Perl;
use Moo;
use Web::Scraper;
use URI;

extends 'UpdateChecker::Websides';

sub get_new_data {
	my ($self) = @_;

	$self->url(q(http://linux.slashdot.org));
	$self->data_file('slashdot.yaml');
	$self->_load_data();

	my $heads = scraper {
        process 'span', 'titles[]' => sub {
                my $elem = shift;
                my $attr = $elem->attr('id');

                return unless $attr;

                if($attr =~ /\Atitle/) {
                        my $element = $elem->as_text;
                        return $elem->as_text;
                }
        };
	};

	my $res = $heads->scrape(URI->new($self->url));

	my @heads_filtered = grep { $_ ne '' } @{$res->{titles}};

	my @result;
	for my $head (@heads_filtered) {
        push(@result, { head => $head, body => '' });
	}

	return @result;
}

no Moo;
__PACKAGE__->meta->make_immutable();
1;
