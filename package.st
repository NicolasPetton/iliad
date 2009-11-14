Eval [
  PackageBuilder new
    name: 'Iliad';
    namespace: 'Iliad';
    prereq: 'Iliad-Core';
    prereq: 'Iliad-Swazoo';
    prereq: 'Iliad-More';

    resource: 'Public/iliad_ie_history.html';
    resource: 'Public/javascripts/no_conflict.js';
    resource: 'Public/javascripts/jquery132min.js';
    resource: 'Public/javascripts/iliad.js';
    resource: 'Public/stylesheets/iliad.css';
    resource: 'Public/images/ajax_loader.gif';
    resource: 'Public/images/iliad.png';

    url: 'git://github.com/NicolasPetton/iliad.git';

    buildXml
]
