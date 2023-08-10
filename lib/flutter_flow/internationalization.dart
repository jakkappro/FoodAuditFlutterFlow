import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'sk'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? skText = '',
  }) =>
      [enText, skText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Home
  {
    '7a876va4': {
      'en': 'Home',
      'sk': 'Domov',
    },
  },
  // Settings
  {
    's8m3njvu': {
      'en': 'Settings of profile',
      'sk': 'Nastavenia profilu',
    },
    'z4exo5ew': {
      'en': 'Change your information',
      'sk': 'Zmeňte svoje informácie',
    },
    'mg17prl1': {
      'en': 'Save settings',
      'sk': 'Uložiť nastavenia',
    },
    'hkfm3k80': {
      'en': 'Profile',
      'sk': 'Profil',
    },
  },
  // Camera
  {
    'd649aowc': {
      'en': 'Camera',
      'sk': 'fotoaparát',
    },
  },
  // Onborading
  {
    'mkv4663x': {
      'en': 'Shop smarter, live helthier',
      'sk': 'Nakupujte inteligentnejšie, žite zdravšie',
    },
    'f3olbm79': {
      'en':
          'Discover every information about your food. Register for better personalization and information tailored for you',
      'sk':
          'Zistite všetky informácie o svojom jedle. Zaregistrujte sa pre lepšiu personalizáciu a informácie prispôsobené pre vás',
    },
    'jxo4sfdl': {
      'en': 'Register for free',
      'sk': 'Zaregistrujte sa zadarmo',
    },
    'vrs43w0j': {
      'en': 'Continue without registration',
      'sk': 'Pokračovať bez registrácie',
    },
    'oltqxqnb': {
      'en': 'Registration',
      'sk': 'Registrácia',
    },
    'nbgy9scs': {
      'en': 'Registrate with following platforms',
      'sk': 'Zaregistrujte sa na nasledujúcich platformách',
    },
    '25x4uzl2': {
      'en': 'Home',
      'sk': 'Domov',
    },
  },
  // SubSettings
  {
    'ld7ofmbx': {
      'en': 'Casper Ghost',
      'sk': 'Casper Ghost',
    },
    'bg589h68': {
      'en': 'casper@ghustbusters.com',
      'sk': 'casper@ghustbusters.com',
    },
    '62n0b6f1': {
      'en': 'My Account Information',
      'sk': 'Informácie o mojom účte',
    },
    '1ihorlxo': {
      'en': 'Support',
      'sk': 'podpora',
    },
    'aoikoq8o': {
      'en': 'Tutorial',
      'sk': 'Návod',
    },
    'sivfvm7g': {
      'en': 'Submit a Bug',
      'sk': 'Odoslať chybu',
    },
    'bs48x2wg': {
      'en': 'Submit a Feature Request',
      'sk': 'Odoslať žiadosť o funkciu',
    },
    '1hednwwd': {
      'en': 'Light ',
      'sk': 'Svetlo',
    },
    'cczz4vwc': {
      'en': 'Dark',
      'sk': 'Tmavý',
    },
    'm6y5vmfu': {
      'en': 'Log Out',
      'sk': 'Odhlásiť sa',
    },
    'hc06njtk': {
      'en': 'My Profile',
      'sk': 'Môj profil',
    },
    'wttyk6e8': {
      'en': '__',
      'sk': '__',
    },
  },
  // SetUpWizard
  {
    'ifbezgj8': {
      'en': 'Create your profile',
      'sk': 'Vytvorte si profil',
    },
    'r247e285': {
      'en':
          'Selected information will be used only for personalisation of results for you and won\'t be provided for third parties.',
      'sk':
          'Vybrané informácie budú použité iba na prispôsobenie výsledkov pre vás a nebudú poskytnuté tretím stranám.',
    },
    'v9zuktnc': {
      'en': 'Continue to next step',
      'sk': 'Pokračujte ďalším krokom',
    },
    '0ntgcuf1': {
      'en': 'Continue without registration',
      'sk': 'Pokračovať bez registrácie',
    },
    '1p2e8too': {
      'en': 'Tell us something about yourself',
      'sk': 'Povedz nám niečo o sebe',
    },
    'lpyawdzf': {
      'en':
          'Filled information will be used only for personalisation of results for you and won\'t be provided to third parties.',
      'sk':
          'Vyplnené informácie budú použité iba na personalizáciu výsledkov pre vás a nebudú poskytnuté tretím stranám.',
    },
    'dvh22apf': {
      'en': 'Finish registration',
      'sk': 'Dokončite registráciu',
    },
    'fed90zl7': {
      'en': 'Continue without registration',
      'sk': 'Pokračovať bez registrácie',
    },
    'gwn7oggo': {
      'en': 'Home',
      'sk': 'Domov',
    },
  },
  // Notifications
  {
    'ituuabx5': {
      'en': 'Notifications',
      'sk': 'Upozornenia',
    },
    'axgz8q6h': {
      'en': 'Open',
      'sk': 'OTVORENÉ',
    },
    '8836p6te': {
      'en': '50%',
      'sk': '50 %',
    },
  },
  // SlidingUpPanelFromEan
  {
    'jk4xh0b8': {
      'en': 'Allergens',
      'sk': 'Alergény',
    },
    'z861kbv3': {
      'en': 'Medication contraindications',
      'sk': 'Kontraindikácie liekov',
    },
    'ysgynb85': {
      'en': 'Nutrition data',
      'sk': 'Údaje o výžive',
    },
    'mettjq8p': {
      'en': '100 g/100ml',
      'sk': '100 g/100 ml',
    },
    '6n80je7x': {
      'en': 'Potiahni pre viac informácií',
      'sk': 'Potiahni pre viac informácií',
    },
  },
  // Header
  {
    'uy4uktgo': {
      'en': 'Scan your first product.',
      'sk': 'Naskenujte svoj prvý produkt.',
    },
  },
  // Intolerancies
  {
    'x8bene62': {
      'en': 'My preferences',
      'sk': 'Moje preferencie',
    },
    '2h01pai8': {
      'en': 'Intolerances',
      'sk': 'Intolerancie',
    },
    'wk3wjgs4': {
      'en': 'Wheat',
      'sk': 'Pšenica',
    },
    'p2mshd0m': {
      'en': 'Crustaceans',
      'sk': 'Kôrovce',
    },
    '3jo6ppbt': {
      'en': 'Eggs',
      'sk': 'Vajcia',
    },
    'l9fty51k': {
      'en': 'Fish',
      'sk': 'Ryby',
    },
    't9nu3dx8': {
      'en': 'Peanuts',
      'sk': 'Arašidy',
    },
    '56yvj6gf': {
      'en': 'Soybeans',
      'sk': 'Sójové zrná',
    },
    '70ryefpb': {
      'en': 'Milk',
      'sk': 'Mlieko',
    },
    'snee8f0w': {
      'en': 'Nuts',
      'sk': 'Orechy',
    },
    '9ux8lpst': {
      'en': 'Celery',
      'sk': 'Zeler',
    },
    'km3fczi3': {
      'en': 'Mustard',
      'sk': 'Horčica',
    },
    'hoeugyln': {
      'en': 'Sesame',
      'sk': 'Sezam',
    },
    's9x4vj8y': {
      'en': 'Sulphites',
      'sk': 'Oxid siričitý a siričitany',
    },
    '5oztm4nk': {
      'en': 'Lupin',
      'sk': 'Vlčí bôb',
    },
    'cjorje3a': {
      'en': 'Molluscs',
      'sk': 'Mäkkýše',
    },
  },
  // ScannedItem
  {
    'h1rwoyzn': {
      'en': '50%',
      'sk': '50 %',
    },
  },
  // OpenScannerButton
  {
    '83m0yhl8': {
      'en': 'Open scanner',
      'sk': 'Otvorte skener',
    },
  },
  // AddManuallyButton
  {
    '7dl2baci': {
      'en': 'Add manualy',
      'sk': 'Pridajte manuálne',
    },
  },
  // ScanProductMessage
  {
    'cz2154o8': {
      'en': 'Scan your product',
      'sk': 'Naskenujte svoj produkt',
    },
    'rju430wl': {
      'en': 'Hold barcode or ingredients list \ninside square area',
      'sk': 'Držte čiarový kód alebo zoznam zložiek\nvnútri štvorcovej plochy',
    },
  },
  // AuthComponent
  {
    'nltnyzvs': {
      'en': 'Sign in with Apple',
      'sk': 'Prihláste sa pomocou Apple',
    },
    'gbe6jirv': {
      'en': 'Continue with Facebook',
      'sk': 'Pokračujte s Facebookom',
    },
    '7s7pf04t': {
      'en': 'Sign in with Google',
      'sk': 'Prihláste sa pomocou Google',
    },
    'nodogpy4': {
      'en': 'Pokračujte ako hosť',
      'sk': 'Pokračujte ako hosť',
    },
  },
  // RecycleInfo
  {
    'ps7rr3mp': {
      'en': 'Túto potravinu vyhoďte do plastov',
      'sk': 'Túto potravinu vyhoďte do plastov',
    },
  },
  // Medication
  {
    '8ebakrts': {
      'en': 'Medication',
      'sk': 'Lieky',
    },
    'x0l4523o': {
      'en': 'Which medication you use?',
      'sk': 'Aké lieky užívate?',
    },
    'pzvtqcye': {
      'en': '',
      'sk': '',
    },
    'jv8nw803': {
      'en': 'Start typing name of product...',
      'sk': 'Začnite písať názov produktu...',
    },
  },
  // AvatarMenu
  {
    'c7ui5zar': {
      'en': 'Choose your avatar',
      'sk': 'Vyberte si svojho avatara',
    },
  },
  // PersonalInfo
  {
    'tl0j5ukv': {
      'en': '',
      'sk': 'názov',
    },
    'ulejwi2y': {
      'en': 'Male',
      'sk': 'Muž',
    },
    'xk29a6ac': {
      'en': 'Femlae',
      'sk': 'Femlae',
    },
    'oa8xf1yu': {
      'en': 'Attach hellicopter',
      'sk': 'Pripojte helikoptéru',
    },
    'bdrrcflo': {
      'en': 'Pohlavie',
      'sk': 'Pohlavie',
    },
    'hwg21qi2': {
      'en': 'Search for an item...',
      'sk': 'Vyhľadať položku...',
    },
  },
  // Miscellaneous
  {
    '0pmcra0v': {
      'en': 'Camera please',
      'sk': 'Fotoaparát prosím',
    },
    '7amhlqg5': {
      'en': 'PhotoLibrary please',
      'sk': 'Fotoknižnica prosím',
    },
    'pxz62r6y': {
      'en': 'Location please',
      'sk': 'Miesto prosím',
    },
    'octmx5xr': {
      'en': 'Notification please',
      'sk': 'Prosím o oznámenie',
    },
    '0fxz3xex': {
      'en': 'Flahslight please',
      'sk': 'Baterku prosím',
    },
    'm53ynt3i': {
      'en': '',
      'sk': '',
    },
    'r56s8vnj': {
      'en': '',
      'sk': '',
    },
    'jwly6t7z': {
      'en': '',
      'sk': '',
    },
    'o1lkedd9': {
      'en': '',
      'sk': '',
    },
    'itvhoe67': {
      'en': '',
      'sk': '',
    },
    '1jtehehr': {
      'en': '',
      'sk': '',
    },
    'wm16epfg': {
      'en': '',
      'sk': '',
    },
    '22i2mbne': {
      'en': '',
      'sk': '',
    },
    'ies6tw6a': {
      'en': '',
      'sk': '',
    },
    'mkslgeq1': {
      'en': '',
      'sk': '',
    },
    'z2a8jwzg': {
      'en': '',
      'sk': '',
    },
    'g3qftkrk': {
      'en': '',
      'sk': '',
    },
    'cxfm5d59': {
      'en': '',
      'sk': '',
    },
    'pydh2weg': {
      'en': '',
      'sk': '',
    },
    'b6zmcsxg': {
      'en': '',
      'sk': '',
    },
    '8fdln5vm': {
      'en': '',
      'sk': '',
    },
    'glwzm40m': {
      'en': '',
      'sk': '',
    },
    'y0wgxavh': {
      'en': '',
      'sk': '',
    },
    '16wdxixo': {
      'en': '',
      'sk': '',
    },
    'gtslzckl': {
      'en': '',
      'sk': '',
    },
    'wvqqpt57': {
      'en': '',
      'sk': '',
    },
    'u9fu37vx': {
      'en': '',
      'sk': '',
    },
    'zvqjmmnb': {
      'en': '',
      'sk': '',
    },
  },
].reduce((a, b) => a..addAll(b));
