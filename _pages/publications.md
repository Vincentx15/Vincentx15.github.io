---
layout: archive
title: "Publications"
permalink: /publications/
author_profile: true
---

{% include base_path %}
{% comment %} Content lives in _data/publications.yml, grouped here by year (newest first) {% endcomment %}
{% assign pubs = site.data.publications %}
{% assign years = pubs | group_by: "year" | sort: "name" | reverse %}

See also my [Google Scholar]({{ site.author.googlescholar }}) profile. <sup>*</sup> denotes equal contribution.

<div class="pub-filter" hidden>
  <button type="button" class="pub-badge pub-badge--all is-active" data-filter="all">All <span class="pub-filter__count">{{ pubs.size }}</span></button>
  {% for t in site.data.publication_types %}{% assign n = pubs | where: "section", t[0] | size %}{% if n > 0 %}<button type="button" class="pub-badge pub-badge--{{ t[0] }}" data-filter="{{ t[0] }}">{{ t[1] }} <span class="pub-filter__count">{{ n }}</span></button>{% endif %}{% endfor %}
</div>

{% for y in years %}
<section class="pub-year">
<h2>{{ y.name }}</h2>
{% for pub in y.items %}{% include publication.html pub=pub %}{% endfor %}
</section>
{% endfor %}

<script src="{{ base_path }}/assets/js/pub-filter.js"></script>
