---
# code is from http://helw.net/2015/07/19/migrating-to-hugo-from-hexo/
# Ran fine on Windows 10 with MSysGit installed
# cd to directory with all the md files from Hexo
# bash hexo2hugo.sh
# ensure dates don't start with single quotes
for file in *; do awk '{
if ($1 == "date:") {
  gsub("\047", "", $0); print;
} else {
  print $0;
}
}' "$file" > temp.md && mv temp.md $file ; done

# fix the dates and add the three dashes as the first line
for file in *; do awk '{
  if (NR == 1) { print "---"; }
  if ($1 == "date:") {
    printf("%s %sT%s+00:00\n", $1, $2, $3);
  } else {
    print $0;
  }
}' "$file" > temp.md && mv temp.md $file ; done

# wrap dates with quotes that aren't wrapped in quotes
for file in *; do awk '{
  if ($1 == "date:") {
    if ($2 ~ /^"/) {
      print $0;
    } else {
      printf("%s \"%s\"\n", $1, $2);
    }
  } else { print $0; }
}' "$file" > temp.md && mv temp.md $file; done
