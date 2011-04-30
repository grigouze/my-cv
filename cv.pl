#!/usr/bin/perl

use Modern::Perl;
use Template qw( );

my $tt = Template->new( { INCLUDE_PATH => '.', } ) || die "$Template::ERROR\n";

my $vars = {
    en => { },
    fr => {
        title        => 'Cv de Mickael Jouanne',
        name         => 'Mickael Jouanne',
        age          => '31 ans',
        mobile_phone => '0609524154',
        email        => 'grigouze@yahoo.fr',
        objectives   => [
            'Expert en développement web',
            '10 ans d\'experience',
            'Test Driven Development',
        ],
        title_experience => 'Expérience',
        experiences      => [
            {
                name            => 'Lead developer',
                company         => 'gandi.net',
                url             => 'http://www.gandi.net',
                date_start      => '2005-12-01',
                date_end        => '2010-01-30',
                date_start_abbr => '12/2005',
                date_end_abbr   => 'aujourd\'hui',
                text =>
"Refonte totale du site web de gandi. Réécriture totale des API ainsi que des backends. Cette refonte a permis d'augmenter le chiffre d'affaire de 30% dès le premier mois. Je suis ensuite devenu responsable de la partie nom de domaine, avec l'apprentissage du language EPP pour échanger avec les registres.",
            },
            {
                name            => 'Dir. tech. chef de projet',
                company         => 'Publicis Consultants',
                url             => 'http://www.publicis-consultants.fr/',
                date_start      => '2004-01-01',
                date_end        => '2005-12-01',
                date_start_abbr => '2004',
                date_end_abbr   => '2005',
                text =>
'Intégration de la société Publicis Consultants suite au rachat de la société apr-job. En charge du développement
                de sites client avec une équipe de 3 personnes que je dirige. Utilisation exclusive de logiciels open-source
                tel que Linux, Apache, Perl, Python, Zope, Postfix, CVS, Subversion, MySQL et PostgreSQL.
                Mise en place d’outil de gestion de projet et de reporting pour permettre d’avoir une vision en temps réel
                de l’avancement des projets aussi bien du coté du client que moi-même.',
            },
            {
                name            => 'Développeur web',
                company         => 'apr-job.com',
                url             => 'http://www.apr-job.com',
                date_start      => '2000-01-01',
                date_end        => '2004-01-01',
                date_start_abbr => '2000',
                date_end_abbr   => '2004',
                text =>
'Réalisation complète du site Internet http://apr-job.com : site généraliste dédié à l’emploi sur internet. La mise à jour et le contenu du site est assurée par une équipe de 4 personnes, dont moi-même. Les technologies utilisées sont Apache / Mysql / mod_perl. Puis ensuite Postgresql remplacera Mysql. Le site deviendra le 5ème site emploi généraliste français.',
            },
            {
                name            => 'Technicien informatique',
                company         => 'Colt Telecom',
                url             => 'http://www.colt.net/FR-fr/index.htm',
                date_start      => '1999-07-01',
                date_end        => '1999-12-31',
                date_start_abbr => 'juil. 1999',
                date_end_abbr   => 'dec. 1999',
                text =>
'Chargé de la maintenance informatique et de l’aide aux utilisateurs. Installation de logiciels open-source.',
            },
        ],
        title_diplome => 'Diplômes et formations',
        diplomes      => [
            {
                name    => 'Extreme Programming',
                details => 'Formation de 5 jours en <br />Extreme Programming'
            },
            {
                name    => 'DUT Informatique',
                details => 'Option Génie Informatique <br />Mention Bien'
            },
        ],
        title_bac     => 'Baccalauréat',
        bac           => { details => 'Série ES' },
        title_langues => 'Langues',
        langues       => [
            { name => 'Anglais',  skill => 'Parlé, lu et écrit couramment' },
            { name => 'Allemand', skill => 'Niveau scolaire' },
        ],
        title_computer => 'Informatique',
        computers      => [
            { name => 'OS', list => [ 'UNIX, Linux', 'Mac OS X', 'Windows' ] },
            {
                name => 'Languages',
                list => [
                    'HTML, CSS, Javascript, JSON, XML',
                    'Perl, Python, C, PHP, Shell, Java',
                    'SQL, PL/SQL'
                ]
            },
            {
                name => 'Bases de données',
                list => [ 'PostgreSQL, MySQL', 'MongoDB, CouchDB' ]
            },
            {
                name => 'Développement',
                list => [ 'Subversion, Git', 'Trac, github, CPAN' ]
            },
        ],
        title_divers => 'Divers',
        divers =>
          [ 'Apache, lighttpd', 'Cybermut, Paypal, Maxmind', 'Hudson/Jenkins' ],
        title_loisirs => 'Loisirs',
        loisirs => [ 'Littérature, musique', 'Technologie web', 'Natation' ],

    },
};

foreach my $lang ( keys %$vars) {
    $vars->{$lang}->{'lang'} = $lang;
    $tt->process( "cv.tmpl.html", $vars->{$lang}, "output/cv.$lang.html" )
      || die $tt->error(), "\n";
}
