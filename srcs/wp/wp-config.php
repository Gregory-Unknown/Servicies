<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', 'esobchak' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'URRVna|[m^)`^9kb6;+Q>vCunl=[sW`;$#NME&-Iels%<}hvSei@#)) 2I&V~1cG');
define('SECURE_AUTH_KEY',  'Q>n&inWga55);_g*2&_:-Z~s%`sSnc^DVzyM)Hoj]rCPwB,@&b6Ck.e@||E8NKio');
define('LOGGED_IN_KEY',    '2r7R`WeSL<5O>< BpoH~$maRT_^<$W+I~uX [! wol%t2mYJ<ehS,,7)9}~c#ZaA');
define('NONCE_KEY',        'MPdom@2R<5C)Nnu/qqW+dL[:-Uj/v*jQF!>%Ydacg<`qm=,=1~k#s53Z3c||}C*l');
define('AUTH_SALT',        'Pw$5?YT<TA;o#IRi|)t q-Gb]tm?kA,U?BA3<;mn{Szh;Fjz:*e50*77r=)9W)~H');
define('SECURE_AUTH_SALT', 'K;X$%Ruh5*L}SDnF?iLs&sjq?cUKKZ8:6ZWZfPfD.ThhxN8sI-5)>7-rO8AMG+<m');
define('LOGGED_IN_SALT',   'vk}J%y{l+[K,0dX}je&7)zzb-~6a?+p  NR#tc3Qob#7$=~;2#?#tx|DT%ugaK?p');
define('NONCE_SALT',       'smVD,j-zDC}:cxXxdva=BzZ_GvZNJnAYr*$+^|@_iiHSia0e~7=`<U!@0N1=rgwJ');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
