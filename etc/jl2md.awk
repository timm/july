NR==1          {  print "#" FILENAME "\n\n\n"} 
sub(/^#: /     { line1=$0; next; line1=$0; 
                 sub(/^function/,"",line2)
                 sub(/(    .*|\).*)/,")",line2)
                 print "|" line2 "|" line1 "|"}
sub(/^# /,"") {  last=$0; print $0; next}
