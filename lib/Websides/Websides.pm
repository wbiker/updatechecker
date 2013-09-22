#
#===============================================================================
#
#         FILE: Websides.pm
#
#  DESCRIPTION: This is the base class for all classes that check for updates.
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: wba (wolf), wbiker@gmx.at
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 22/09/13 18:57:48
#     REVISION: ---
#===============================================================================
package UpdateChecker::Websides;
use Modern::Perl;
use Moose;


=head3
	data_file is to store data persistent.
	Each sub class can use it to save information
=cut
has 'data_file' => ( isa => 'Str', is => 'rw' );

=head3
	data is used to store the content of the the data_file
=cut
has 'data' => ( isa => 'Str', is => 'rw' );

=head3
	page saved the webside URL
=cut
has 'url' => ( isa => 'Str', is => 'rw' );


=head2
	Methode for the use of this class
=cut

=head3
	Is used to check for changes and get the data back
	Must be overrided by all sub classes
=cut
sub get_new_stories {
	my ($self) = @_;
	
	if(-e $self->data_file) {
		open(my $fh, "<", $self->data_file or die "Could not open data file '$self->data_file'";
		{
			local $/;
			$self->data(<$fh>);
		}

		close($fh);
	}
}
=head2
	Methods used internaly by this module
=cut

=head3
	_load_data opens the data file and read the content. 
	Skipped all comments marked with #
=cut
sub _load_data {
	my ($self) = @_;
	
	
}


no Moose;
1;

