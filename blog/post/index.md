---
layout: page
---

<section>
	<header class="major">
		<h2>Posts</h2>
	</header>
	<div class="posts">
		{% assign posts = site.pages | some:3 %}
        {% for post in posts %}
		<article>
			<a href="#" class="image"><img src="assets/images/pic01.jpg" alt="" /></a>
			<h3>Interdum aenean</h3>
			<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
			<ul class="actions">
				<li><a href="#" class="button">More</a></li>
			</ul>
		</article>
        {% endfor %}
		<!-- {
			"layout"=&gt;"page",
			"title"=&gt;"Adipiscing",
			"content"=&gt;"<h1>WOW ~~~ </h1>\n",
			"dir"=&gt;"/blog/post/",
			"name"=&gt;"adipiscing.md",
			"path"=&gt;"blog/post/adipiscing.md",
			"url"=&gt;"/blog/post/adipiscing.html"
		} -->
	</div>
</section>