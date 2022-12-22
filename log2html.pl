# Script forked from Panike: https://gist.github.com/panike/811354


sub new_hl {
        my @l = ();
        return \@l;
}

@args = @ARGV;
shift @args;
print "<html>\n";
print "<head>\n";
print " <meta charset=\"utf-8\">\n";
print "</head>\n";
print "<body><pre>\n";
open REVLIST, "git log " . join(' ',@args) . " --topo-order --abbrev-commit --graph|" || die "Cannot get log";
while(<REVLIST>){
        chomp;
        if(/^Merge: /){
                next;
        }
        if(/^commit/){
                @list = split / /;
                @tlist = @list;
                print "commit <a name=\"$list[1]\"></a>$list[1]\n";
                @list = @list[2 .. $#list];
                foreach $key (@list) {
                        print "parent <a href=\"\#$key\">$key</a>\n";
                        if(!$commits{$key}){
                                $commits{$key}=new_hl;
                        }
                        push @{$commits{$key}}, $tlist[1];
                }
                foreach $key (@{$commits{$tlist[1]}}){
                        print "child <a href=\"\#$key\">$key</a>\n";
                }
        }else{
                s/</\&lt;/g;
                s/>/\&gt;/g;
                print;
                print "\n";
        }
}
print "</pre></body>\n";
print "</html>\n";

