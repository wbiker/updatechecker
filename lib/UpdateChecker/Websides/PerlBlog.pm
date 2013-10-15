#
#===============================================================================
#
#         FILE: PerlBlog.pm
#
#  DESCRIPTION: This encapsulate the code to fetch Perl Blog head lines.
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: wba (wolf), wbiker@gmx.at
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 26/09/13 18:52:13
#     REVISION: ---
#===============================================================================

package UpdateChecker::Websides::PerlBlog;

use Modern::Perl;
use Moo;
use Web::Scraper;
use URI;

extends 'UpdateChecker::Websides';

sub get_new_data {
	my ($self) = @_;
	my $url = 'http://blogs.perl.org';                                                                   
                                                  
	my $heads = scraper {                                                                                
    	process "div.entry", 'entries[]' => scraper {                                                
    		process ".entry-title>a", head => 'TEXT';                                            
		    process ".entry-body", body => 'TEXT';                                               
    	};
	};                                                                                                   
                                                                                                   
  	say "get url $url";                                                                                  
	my $res = $heads->scrape(URI->new($url));                                                            
  	say "done.";                                                                                         
  	my @titles = @{$res->{entries}};                                                                     

	return @titles;
}

no Moo;
__PACKAGE__->meta->make_immutable();
1;
