---
layout: archive
title: "Publications"
permalink: /publications/
author_profile: true
---

{% comment %} Content lives in _data/publications.yml {% endcomment %}
{% assign sections = "journal:Journal articles|conference:Conference proceedings|workshop:Workshop papers|preprint:Preprints" | split: "|" %}

See also my [Google Scholar]({{ site.author.googlescholar }}) profile. <sup>*</sup> denotes equal contribution.

{% for s in sections %}
{% assign key = s | split: ":" | first %}
{% assign label = s | split: ":" | last %}
{% assign pubs = site.data.publications | where: "section", key %}
{% if pubs.size > 0 %}
<h2>{{ label }}</h2>
{% for pub in pubs %}{% include publication.html pub=pub %}{% endfor %}
{% endif %}
{% endfor %}
