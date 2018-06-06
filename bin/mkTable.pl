use LaTeX::Table;
use Spreadsheet::Read;
use Number::Format qw(:subs);  # use mighty CPAN to format values
use strict;
use warnings;
my $book  = Spreadsheet::Read->new($ARGV[0]);
my @sheets=$book->sheets;
my @rows;
foreach my $sheet(@sheets){
	my $s=$book->sheet($sheet);
	my @header =$s->row(1);
	my $maxrow=$s->maxrow;
	for my $row (1..$maxrow){
		my @row =$s->row($row);
		push @rows,\@row;
	}





	my $table = LaTeX::Table->new(
		{   
			filename    => "$sheet.tex",
			maincaption => "$sheet",
			#caption     => 'Try our special offer today!',
			label       => "table:$sheet",
			position    => 'tbp',
			header      => [\@header],
			data        => \@rows,
		}


	);
	$table->set_width('\textwidth');
        $table->set_width_environment('tabularx');
	$table->setp_theme('NYC4');
	$table->set_type('std');



	$table->generate();
}


