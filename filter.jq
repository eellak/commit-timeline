# jq filter to convert the JSON output of a GitHub commit into the
# HTML elements required for a Twitter-like timeline.
#
# Diomidis Spinellis, December 2014
#

.[] |
[
	"<p>",
	# Date and time
	.commit.author.date[0:10],
	" ",
	.commit.author.date[11:19],
	"<br />",
	# Committer image
	"<a href='",
	.committer.url,
	"'><img width='72' src='",
	.committer.avatar_url,
	"' /></a>",
	# Committer login
	"<a href='",
	.committer.html_url,
	"'>",
	(.committer.login | @html),
	"</a>",
	# Committer name
	":<br />",
	"<a href='",
	.committer.html_url,
	"'>",
	(.commit.author.name | @html),
	"</a>",
	"<br />",
	# Commit message
	"<a href='",
	.html_url,
	"'>",
	(.commit.message | @html),
	"</a>",
	"</p>",
	""
] |
add
