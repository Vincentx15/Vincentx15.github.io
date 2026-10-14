// Publication type filter for /publications/: clicking a badge shows only that type,
// clicking it again (or "All") shows everything. The filter is kept in the URL hash
// (/publications/#journal) so it can be linked. Without JS the full list is shown.
(function () {
  var bar = document.querySelector('.pub-filter');
  if (!bar) return;
  bar.hidden = false;

  var current = 'all';

  function apply(type) {
    if (!bar.querySelector('[data-filter="' + type + '"]')) type = 'all';
    current = type;
    history.replaceState(null, '', type === 'all' ? location.pathname : '#' + type);
    document.querySelectorAll('.pub').forEach(function (pub) {
      pub.hidden = type !== 'all' && pub.dataset.type !== type;
    });
    document.querySelectorAll('.pub-year').forEach(function (year) {
      year.hidden = !year.querySelector('.pub:not([hidden])');
    });
    bar.querySelectorAll('[data-filter]').forEach(function (b) {
      b.classList.toggle('is-active', b.dataset.filter === type);
      b.setAttribute('aria-pressed', b.dataset.filter === type);
    });
  }

  apply(location.hash.slice(1) || 'all');

  document.addEventListener('click', function (e) {
    var badge = e.target.closest('.pub-badge[data-filter]');
    if (!badge) return;
    var type = badge.dataset.filter;
    apply(type === current && type !== 'all' ? 'all' : type);
    if (!bar.contains(badge)) bar.scrollIntoView({ behavior: 'smooth', block: 'center' });
  });
})();
