import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ru', 'es', 'ja', 'ar'];

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
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? ruText = '',
    String? esText = '',
    String? jaText = '',
    String? arText = '',
  }) =>
      [enText, ruText, esText, jaText, arText][languageIndex] ?? '';
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
  // Language
  {
    'z258brx9': {
      'en': 'Please choose a language',
      'ar': 'Please choose a language',
      'es': 'Please choose a language',
      'ja': 'Please choose a language',
      'ru': 'Please choose a language',
    },
    '8swe181o': {
      'en': 'ENGLISH',
      'ar': 'ENGLISH',
      'es': 'ENGLISH',
      'ja': 'ENGLISH',
      'ru': 'ENGLISH',
    },
    '6n6ffivf': {
      'en': 'РУССКИЙ',
      'ar': 'РУССКИЙ',
      'es': 'РУССКИЙ',
      'ja': 'РУССКИЙ',
      'ru': 'РУССКИЙ',
    },
    '9jgt0kph': {
      'en': 'ESPAÑOL',
      'ar': 'ESPAÑOL',
      'es': 'ESPAÑOL',
      'ja': 'ESPAÑOL',
      'ru': 'ESPAÑOL',
    },
    'jguowibg': {
      'en': '日本語',
      'ar': '日本語',
      'es': '日本語',
      'ja': '日本語',
      'ru': '日本語',
    },
    'x0c3a2zl': {
      'en': 'عربى',
      'ar': 'عربى',
      'es': 'عربى',
      'ja': 'عربى',
      'ru': 'عربى',
    },
    'bmetd3l7': {
      'en': 'OK',
      'ar': 'OK',
      'es': 'OK',
      'ja': 'OK',
      'ru': 'OK',
    },
    'jczuhabi': {
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
  },
  // HomePage
  {
    'ypfz29i7': {
      'en': 'OK',
      'ar': 'OK',
      'es': 'OK',
      'ja': 'OK',
      'ru': 'OK',
    },
    '2eqpkck1': {
      'en': 'If you have not yet chosen a route to travel, go to the website',
      'ar': 'إذا لم تكن قد اخترت طريقا للسفر بعد ، فانتقل إلى موقع الويب',
      'es': 'Si aún no ha elegido una ruta para viajar, vaya al sitio web',
      'ja': '旅行するルートをまだ選択していない場合は、ウェブサイトにアクセスしてください',
      'ru': 'Если вы еще не выбрали маршрут для путешествия перейдите на сайт',
    },
    'b0eqhtut': {
      'en': 'How to use the app?',
      'ar': 'كيفية استخدام التطبيق?',
      'es': '¿Cómo utilizar la aplicación?',
      'ja': 'どのようにアプリを使用するには？',
      'ru': 'Как использовать приложение?',
    },
    'wf7mh0gc': {
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
  },
  // Trip1
  {
    '7b7tfv87': {
      'en': 'Ваше путешествие начнется через:',
      'ar': 'аше путешествие начнется ерез:',
      'es': 'Ваше путешествие начнется через:',
      'ja': '重要事項:',
      'ru': 'Ваше путешествие началось через:',
    },
    'hy6dw4ym': {
      'en': 'Porsche 911 Carrera GTS',
      'ar': 'بورش 911 كاريرا جي تي إس',
      'es': 'Porsche 911 Carrera GTS',
      'ja': 'ポルシェ 911 カレラ GTS',
      'ru': 'Порше 911 Каррера ГТС',
    },
    'wzbafwa9': {
      'en': '10 октября — 12 октября, 2022',
      'ar': '10 октября - 12 октября، 2022',
      'es': '10 de octubre — 12 de octubre, 2022',
      'ja': '2022 年 10 月 10 日 — 12 日',
      'ru': '10 октября — 12 октября 2022 г.',
    },
    '7ho7tok1': {
      'en': 'Cabo da Roca — Nazare. Portugal',
      'ar': 'كابو دا روكا - نازاري. البرتغال',
      'es': 'Cabo da Roca — Nazaré. Portugal',
      'ja': 'カボ ダ ロカ — ナザレ。ポルトガル',
      'ru': 'Кабо да Рока — Назаре. Португалия',
    },
    'u8lwwu0t': {
      'en': 'More journey details',
      'ar': 'مزيد من تفاصيل الرحلة',
      'es': 'Más detalles del viaje',
      'ja': '旅の詳細',
      'ru': 'Подробнее о путешествии',
    },
    'ocefep6i': {
      'en': 'Как забрать машину?',
      'ar': 'Как забрать машину؟',
      'es': 'Как забрать машину?',
      'ja': 'Как забрать машину?',
      'ru': 'Как забрать машину?',
    },
    '44rr2ku7': {
      'en': 'Home',
      'ar': 'مسكن',
      'es': 'Hogar',
      'ja': '家',
      'ru': 'Дом',
    },
  },
  // Instructions010
  {
    'scniofx1': {
      'en': 'Please read the rules',
      'ar': 'يرجى قراءة القواعد',
      'es': 'Por favor, lea las reglas',
      'ja': 'ルールをお読みください',
      'ru': 'Пожалуйста, ознакомьтесь с правилами',
    },
    'sxcy9gwi': {
      'en': 'ПРАВИЛА ИСПОЛЬЗОВАНИЯ АВТОМОБИЛЯ',
      'ar': 'ПРАВИЛА ИСПОЛЬЗОВАНИЯ АВТОМОБИЛЯ',
      'es': 'ПРАВИЛА ИСПОЛЬЗОВАНИЯ АВТОМОБИЛЯ',
      'ja': 'ПРАВИЛА ИСПОЛЬЗОВАНИЯ АВТОМОБИЛЯ',
      'ru': 'ПРАВИЛА ИСПОЛЬЗОВАНИЯ АВТОМОБИЛЯ',
    },
    'vh0yu7xd': {
      'en':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ar':
          '1. Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'es':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ja':
          '1. Qui execitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ru':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
    },
    'kj98caru': {
      'en': 'ПРАВИЛА СТРАХОВАНИЯ',
      'ar': 'ПРАВИЛА СТРАХОВАНИЯ',
      'es': 'ПРАВИЛА СТРАХОВАНИЯ',
      'ja': 'ПРАВИЛА СТРАХОВАНИЯ',
      'ru': 'ПРАВИЛА СТРАХОВАНИЯ',
    },
    '9d7fg3xw': {
      'en':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ar':
          '1. Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'es':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ja':
          '1. Qui execitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ru':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
    },
    'h4tiew0k': {
      'en': 'ПРАВИЛА ПОЛЬЗОВАНИЯ БРОНЬЮ ГОСТИНИЦЫ',
      'ar': 'ПРАВИЛА ПОЛЬЗОВАНИЯ БРОНЬЮ ГОСТИНИЦЫ',
      'es': 'ПРАВИЛА ПОЛЬЗОВАНИЯ БРОНЬЮ ГОСТИНИЦЫ',
      'ja': 'ПРАВИЛА ПОЛЬЗОВАНИЯ БРОНЬЮ ГОСТИНИЦЫ',
      'ru': 'ПРАВИЛА ПОЛЗОВАНИЯ БРОНЬЮ ГОСТИНИЦЫ',
    },
    'ls5q6opd': {
      'en':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ar':
          '1. Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'es':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ja':
          '1. Qui execitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ru':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
    },
    'rykgo23m': {
      'en': 'ПРАВИЛА БЕЗОПАСНОСТИ',
      'ar': 'ПРАВИЛА БЕЗОПАСНОСТИ',
      'es': 'ПРАВИЛА БЕЗОПАСНОСТИ',
      'ja': 'ПРАВИЛА БЕЗОПАСНОСТИ',
      'ru': 'ПРАВИЛА БЕЗОПАСНОСТИ',
    },
    'q7mejtp8': {
      'en':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ar':
          '1. Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'es':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ja':
          '1. Qui execitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ru':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
    },
    'htnzwlpv': {
      'en': 'ЭКСТРЕННАЯ СВЯЗЬ',
      'ar': 'ЭКСТРЕННАЯ СВЯЗЬ',
      'es': 'ЭКСТРЕННАЯ СВЯЗЬ',
      'ja': 'ЭКСТРЕННАЯ СВЯЗЬ',
      'ru': 'ЭКСТРЕННАЯ СВЯЗЬ',
    },
    'w80no2r8': {
      'en':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ar':
          '1. Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'es':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ja':
          '1. Qui execitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ru':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
    },
    'ytdd4c9f': {
      'en': 'ПРОЧИТАЛ. СОГЛАСЕН',
      'ar': 'РОЧИТАЛ. СОГЛАСЕН',
      'es': 'ПРОЧИТАЛ. СОГЛАСЕН',
      'ja': 'ПРОЧИТАЛ。 СОГЛАСЕН',
      'ru': 'ПРОЧИТАЛ. СОГЛАСЕН',
    },
    '8ckyk7t6': {
      'en': 'Home',
      'ar': 'مسكن',
      'es': 'Hogar',
      'ja': '家',
      'ru': 'Дом',
    },
  },
  // Instructions010Copy
  {
    'v6j5ryey': {
      'en': 'Please read the rules',
      'ar': 'يرجى قراءة القواعد',
      'es': 'Por favor, lea las reglas',
      'ja': 'ルールをお読みください',
      'ru': 'Пожалуйста, ознакомьтесь с правилами',
    },
    'sl6hsy3q': {
      'en': 'ПРАВИЛА ИСПОЛЬЗОВАНИЯ АВТОМОБИЛЯ',
      'ar': 'ПРАВИЛА ИСПОЛЬЗОВАНИЯ АВТОМОБИЛЯ',
      'es': 'ПРАВИЛА ИСПОЛЬЗОВАНИЯ АВТОМОБИЛЯ',
      'ja': 'ПРАВИЛА ИСПОЛЬЗОВАНИЯ АВТОМОБИЛЯ',
      'ru': 'ПРАВИЛА ИСПОЛЬЗОВАНИЯ АВТОМОБИЛЯ',
    },
    '5wnr55cj': {
      'en':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ar':
          '1. Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'es':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ja':
          '1. Qui execitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ru':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
    },
    '35207tv8': {
      'en': 'ПРАВИЛА СТРАХОВАНИЯ',
      'ar': 'ПРАВИЛА СТРАХОВАНИЯ',
      'es': 'ПРАВИЛА СТРАХОВАНИЯ',
      'ja': 'ПРАВИЛА СТРАХОВАНИЯ',
      'ru': 'ПРАВИЛА СТРАХОВАНИЯ',
    },
    'szdpa1zt': {
      'en':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ar':
          '1. Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'es':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ja':
          '1. Qui execitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ru':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
    },
    '7g665hmp': {
      'en': 'ПРАВИЛА ПОЛЬЗОВАНИЯ БРОНЬЮ ГОСТИНИЦЫ',
      'ar': 'ПРАВИЛА ПОЛЬЗОВАНИЯ БРОНЬЮ ГОСТИНИЦЫ',
      'es': 'ПРАВИЛА ПОЛЬЗОВАНИЯ БРОНЬЮ ГОСТИНИЦЫ',
      'ja': 'ПРАВИЛА ПОЛЬЗОВАНИЯ БРОНЬЮ ГОСТИНИЦЫ',
      'ru': 'ПРАВИЛА ПОЛЗОВАНИЯ БРОНЬЮ ГОСТИНИЦЫ',
    },
    'itz9ofjz': {
      'en':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ar':
          '1. Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'es':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ja':
          '1. Qui execitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ru':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
    },
    '34yjos6d': {
      'en': 'ПРАВИЛА БЕЗОПАСНОСТИ',
      'ar': 'ПРАВИЛА БЕЗОПАСНОСТИ',
      'es': 'ПРАВИЛА БЕЗОПАСНОСТИ',
      'ja': 'ПРАВИЛА БЕЗОПАСНОСТИ',
      'ru': 'ПРАВИЛА БЕЗОПАСНОСТИ',
    },
    'af1ge8va': {
      'en':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ar':
          '1. Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'es':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ja':
          '1. Qui execitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ru':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
    },
    'hs74hxm1': {
      'en': 'ЭКСТРЕННАЯ СВЯЗЬ',
      'ar': 'ЭКСТРЕННАЯ СВЯЗЬ',
      'es': 'ЭКСТРЕННАЯ СВЯЗЬ',
      'ja': 'ЭКСТРЕННАЯ СВЯЗЬ',
      'ru': 'ЭКСТРЕННАЯ СВЯЗЬ',
    },
    'es7mzigx': {
      'en':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ar':
          '1. Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'es':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ja':
          '1. Qui execitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ru':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
    },
    'bofdm55b': {
      'en': 'ПРОЧИТАЛ. СОГЛАСЕН',
      'ar': 'РОЧИТАЛ. СОГЛАСЕН',
      'es': 'ПРОЧИТАЛ. СОГЛАСЕН',
      'ja': 'ПРОЧИТАЛ。 СОГЛАСЕН',
      'ru': 'ПРОЧИТАЛ. СОГЛАСЕН',
    },
    '6puna2y2': {
      'en': 'Home',
      'ar': 'مسكن',
      'es': 'Hogar',
      'ja': '家',
      'ru': 'Дом',
    },
  },
  // Trip2
  {
    'pz4ro1we': {
      'en':
          'Кнопки на экране навигатора помогут вам ориентироваться на протяжении всего маршрута. Вы легко можете перейти от одной точки назначения до другой или вернуться назад.  ',
      'ar':
          'на протяжении всего маршрута. هذا هو السبب في أنه من الأفضل أن يكون هذا هو الحال.',
      'es':
          'Кнопки на экране навигатора помогут вам ориентироваться на протяжении всего маршрута. Вы легко можете перейти от одной точки назначения до другой или вернуться назад.',
      'ja':
          'Кнопки на экране навигатора помогут вам ориентироваться на протяжении всего маршрута.この記事は、現在公開されている日付から始まります。',
      'ru':
          'Кнопки на экране навигатора помогут вам ориентироваться на протяжении всего маршрута. Вы можете легко перейти от одной точки назначения к другой или вернуться назад.',
    },
    'vin93ofb': {
      'en': 'ОК. ДАЛЬШЕ',
      'ar': 'ОК. АЛЬШЕ',
      'es': 'ОК. ДАЛЬШЕ',
      'ja': 'ああ。 ДАЛЬШЕ',
      'ru': 'ОК. ДАЛЬШЕ',
    },
    'kuswjwgq': {
      'en':
          'По достижении новой точки навигатор подскажет о наличии интересной информации, которую мы для вас тщательно подобрали. Кликните Point Information. ',
      'ar':
          'остижении новой точки навигатор подскажет о наличии интересной информации، которую для вастор. معلومات نقطة.',
      'es':
          'По достижении новой точки навигатор подскажет о наличии интересной информации, которую мы длля ватес тща Кликните Información del punto.',
      'ja': '私たちは、この問題を解決するために、この問題を解決しました. Кликните ポイント情報。',
      'ru':
          'По следующей оценке навигатор подсказывает о наличии интересной информации, которую мы для вас подобрали. Кликните Информация о точке.',
    },
    'ncaulhea': {
      'en': 'ОК. ДАЛЬШЕ',
      'ar': 'ОК. АЛЬШЕ',
      'es': 'ОК. ДАЛЬШЕ',
      'ja': 'ああ。 ДАЛЬШЕ',
      'ru': 'ОК. ДАЛЬШЕ',
    },
    'c3bdx0kk': {
      'en':
          'Кнопки на экране навигатора помогут вам ориентироваться на протяжении всего маршрута. Вы легко можете перейти от одной точки назначения до другой или вернуться назад.  ',
      'ar':
          'на протяжении всего маршрута. هذا هو السبب في أنه من الأفضل أن يكون هذا هو الحال.',
      'es':
          'Кнопки на экране навигатора помогут вам ориентироваться на протяжении всего маршрута. Вы легко можете перейти от одной точки назначения до другой или вернуться назад.',
      'ja':
          'Кнопки на экране навигатора помогут вам ориентироваться на протяжении всего маршрута.この記事は、現在公開されている日付から始まります。',
      'ru':
          'Кнопки на экране навигатора помогут вам ориентироваться на протяжении всего маршрута. Вы можете легко перейти от одной точки назначения к другой или вернуться назад.',
    },
    'ioa7i7qj': {
      'en': 'ОК. ДАЛЬШЕ',
      'ar': 'ОК. АЛЬШЕ',
      'es': 'ОК. ДАЛЬШЕ',
      'ja': 'ああ。 ДАЛЬШЕ',
      'ru': 'ОК. ДАЛЬШЕ',
    },
    'lyh3zlw8': {
      'en': 'Home',
      'ar': 'مسكن',
      'es': 'Hogar',
      'ja': '家',
      'ru': 'Дом',
    },
  },
  // TripStart
  {
    'tm8bffsz': {
      'en': 'НАЧАТЬ ПУТЕШЕСТВИЕ',
      'ar': 'АЧАТЬ ПУТЕШЕСТВИЕ',
      'es': 'НАЧАТЬ ПУТЕШЕСТВИЕ',
      'ja': 'НАЧАТЬ ПУТЕШЕСТВИЕ',
      'ru': 'НАЧАТЬ ПУТЕШЕСТВИЕ',
    },
    'adl2jnc3': {
      'en': 'Как забрать машину?',
      'ar': 'Как забрать машину؟',
      'es': 'Как забрать машину?',
      'ja': 'Как забрать машину?',
      'ru': 'Как забрать машину?',
    },
    '6r478cgk': {
      'en': 'Home',
      'ar': 'مسكن',
      'es': 'Hogar',
      'ja': '家',
      'ru': 'Дом',
    },
  },
  // MainNavigatorPage
  {
    'gnh6m1of': {
      'en': 'ПОЕХАЛИ!',
      'ar': 'АЛИ!',
      'es': 'ПОЕХАЛИ!',
      'ja': 'ああああああ！',
      'ru': 'ПОЕХАЛИ!',
    },
    'kfr798l2': {
      'en': 'ИНФОРМАЦИЯ О МЕСТЕ',
      'ar': 'ИНФОРМАЦИЯ О МЕСТЕ',
      'es': 'ИНФОРМАЦИЯ О МЕСТЕ',
      'ja': 'ИНФОРМАЦИЯ О МЕСТЕ',
      'ru': 'ИНФОРМАЦИЯ О МЕСТЕ',
    },
    'qp05f9qx': {
      'en': 'Home',
      'ar': 'مسكن',
      'es': 'Hogar',
      'ja': '家',
      'ru': 'Дом',
    },
  },
  // PlaceInformation
  {
    '4wv1lfde': {
      'en': 'STARTING POINT',
      'ar': 'نقطة البداية',
      'es': 'PUNTO DE PARTIDA',
      'ja': '出発点',
      'ru': 'ОТПРАВНАЯ ТОЧКА',
    },
    '7rhxdpfg': {
      'en': 'CASCAIS',
      'ar': 'كاسكا',
      'es': 'CASCAIS',
      'ja': 'カスカイス',
      'ru': 'КАШАЙШ',
    },
    'xg8a54gn': {
      'en': 'PORTUGAL',
      'ar': 'البرتغال',
      'es': 'PORTUGAL',
      'ja': 'ポルトガル',
      'ru': 'ПОРТУГАЛИЯ',
    },
    'zkpybfkk': {
      'en': 'LIGHTHOUSE',
      'ar': 'منارة',
      'es': 'FARO',
      'ja': '灯台',
      'ru': 'МАЯК',
    },
    'bjc02soe': {
      'en':
          'Libero et saepe ipsa cum. Recusandae aut nostrum odit rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Esse officiis inventore voluptates inventore adipisci itaque nostrum. Repudiandae ea et modi veniam.',
      'ar':
          'Libero et saepe ipsa cum. Recusandae aut nostrum odit rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores سايب طارد. Esse officiis يخترع voluptates يخترع adipisci itaque nostrum. Repudiandae ea et modi veniam.',
      'es':
          'Líbero et saepe ipsa cum. Recusandae aut nostrum odit rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Esse officiis inventore voluptates inventore adipisci itaque nostrum. Repudiandae ea et modi veniam.',
      'ja':
          'Libero et saepe ipsa cum. Recusandae aut nostrum od rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat。 Esse officiis Inventorye voluptates Inventory adipisci itaque nostrum. Repudiandae ea et modi veniam.',
      'ru':
          'Либеро и др saepe ipsa диплом. Recusandae aut nostrum odit rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Esse officiis Inventore voluptates Inventure adipisci itaque nostrum. Repudiandae ea et modi veniam.',
    },
    '2apx1aol': {
      'en': 'Listen audio',
      'ar': 'استمع إلى الصوت',
      'es': 'escuchar audio',
      'ja': '音声を聞く',
      'ru': 'Слушайте аудио',
    },
    '0gd3jgil': {
      'en': 'SEASHORE',
      'ar': 'شاطئ البحر',
      'es': 'COSTA',
      'ja': '海岸',
      'ru': 'БЕРЕГ',
    },
    'xopfntch': {
      'en':
          'Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Aut deserunt a laborum asperiores quia in sint eos. Nemo dolores ut aut et natus voluptatem quaerat. Esse officiis inventore voluptates inventore adipisci itaque nostrum. ',
      'ar':
          'Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores سايب طارد. أو تجنب العمل البدني في sint eos. نيمو تلعب مع الطبيعة والحياة الطبيعية. Esse officiis يخترع voluptates يخترع adipisci itaque nostrum.',
      'es':
          'Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Aut deserunt a laborum asperiores quia in sint eos. Nemo dolores ut aut et natus voluptatem quaerat. Esse officiis inventore voluptates inventore adipisci itaque nostrum.',
      'ja':
          'Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat。 Aut deserunt a labourum asperiores quia in sint eos. Nemo dolores ut aut et natus voluptatem quaerat. Esse officiis Inventorye voluptates Inventory adipisci itaque nostrum.',
      'ru':
          'Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Aut deserunt a Laborum asperiores quia in sint eos. Nemo dolores ut aut et natus voluptatem quaerat. Esse officiis Inventore voluptates Inventure adipisci itaque nostrum.',
    },
    'gwcp83bs': {
      'en': 'Listen audio',
      'ar': 'استمع إلى الصوت',
      'es': 'escuchar audio',
      'ja': '音声を聞く',
      'ru': 'Слушайте аудио',
    },
    'quefzvnq': {
      'en': 'BACK TO NAVIGATOR',
      'ar': 'العودة إلى الملاح',
      'es': 'VOLVER AL NAVEGADOR',
      'ja': 'ナビゲーターに戻る',
      'ru': 'ВЕРНУТЬСЯ В НАВИГАТОР',
    },
    'zumghl25': {
      'en': 'Home',
      'ar': 'مسكن',
      'es': 'Hogar',
      'ja': '家',
      'ru': 'Дом',
    },
  },
  // PlaceInformationPoint
  {
    '2uxvi0iv': {
      'en': 'POINT 2 (OF 6)',
      'ar': 'النقطة 2 (من 6)',
      'es': 'PUNTO 2 (DE 6)',
      'ja': 'ポイント 2 (OF 6)',
      'ru': 'ПУНКТ 2 (ИЗ 6)',
    },
    'r20f6faw': {
      'en': 'NEW POINT',
      'ar': 'نقطة جديدة',
      'es': 'PUNTO NUEVO',
      'ja': '新しいポイント',
      'ru': 'НОВАЯ ТОЧКА',
    },
    'yn1gzi9t': {
      'en': 'PORTUGAL',
      'ar': 'البرتغال',
      'es': 'PORTUGAL',
      'ja': 'ポルトガル',
      'ru': 'ПОРТУГАЛИЯ',
    },
    'njcgxhas': {
      'en': 'OLD CASTLE',
      'ar': 'القلعة القديمة',
      'es': 'CASTILLO VIEJO',
      'ja': '古城',
      'ru': 'СТАРЫЙ ЗАМОК',
    },
    'eq6bg4hv': {
      'en':
          'Libero et saepe ipsa cum. Recusandae aut nostrum odit rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Esse officiis inventore voluptates inventore adipisci itaque nostrum. Repudiandae ea et modi veniam.',
      'ar':
          'Libero et saepe ipsa cum. Recusandae aut nostrum odit rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores سايب طارد. Esse officiis يخترع voluptates يخترع adipisci itaque nostrum. Repudiandae ea et modi veniam.',
      'es':
          'Líbero et saepe ipsa cum. Recusandae aut nostrum odit rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Esse officiis inventore voluptates inventore adipisci itaque nostrum. Repudiandae ea et modi veniam.',
      'ja':
          'Libero et saepe ipsa cum. Recusandae aut nostrum od rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat。 Esse officiis Inventorye voluptates Inventory adipisci itaque nostrum. Repudiandae ea et modi veniam.',
      'ru':
          'Либеро и др saepe ipsa диплом. Recusandae aut nostrum odit rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Esse officiis Inventore voluptates Inventure adipisci itaque nostrum. Repudiandae ea et modi veniam.',
    },
    'mt3k8scy': {
      'en': 'Listen audio',
      'ar': 'استمع إلى الصوت',
      'es': 'escuchar audio',
      'ja': '音声を聞く',
      'ru': 'Слушайте аудио',
    },
    'fx5ab5ue': {
      'en': 'OCEANARIUM',
      'ar': 'المحيط',
      'es': 'OCEANARIO',
      'ja': '海洋水族館',
      'ru': 'ОКЕАНАРИЙ',
    },
    'kgw33dh9': {
      'en':
          'Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Aut deserunt a laborum asperiores quia in sint eos. Nemo dolores ut aut et natus voluptatem quaerat. Esse officiis inventore voluptates inventore adipisci itaque nostrum. ',
      'ar':
          'Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores سايب طارد. أو تجنب العمل البدني في sint eos. نيمو تلعب مع الطبيعة والحياة الطبيعية. Esse officiis يخترع voluptates يخترع adipisci itaque nostrum.',
      'es':
          'Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Aut deserunt a laborum asperiores quia in sint eos. Nemo dolores ut aut et natus voluptatem quaerat. Esse officiis inventore voluptates inventore adipisci itaque nostrum.',
      'ja':
          'Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat。 Aut deserunt a labourum asperiores quia in sint eos. Nemo dolores ut aut et natus voluptatem quaerat. Esse officiis Inventorye voluptates Inventory adipisci itaque nostrum.',
      'ru':
          'Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Aut deserunt a Laborum asperiores quia in sint eos. Nemo dolores ut aut et natus voluptatem quaerat. Esse officiis Inventore voluptates Inventure adipisci itaque nostrum.',
    },
    'dqpkzpnq': {
      'en': 'Listen audio',
      'ar': 'استمع إلى الصوت',
      'es': 'escuchar audio',
      'ja': '音声を聞く',
      'ru': 'Слушайте аудио',
    },
    'ewex2sak': {
      'en': 'BACK TO NAVIGATOR',
      'ar': 'العودة إلى الملاح',
      'es': 'VOLVER AL NAVEGADOR',
      'ja': 'ナビゲーターに戻る',
      'ru': 'ВЕРНУТЬСЯ В НАВИГАТОР',
    },
    'pycuatrj': {
      'en': 'Home',
      'ar': 'مسكن',
      'es': 'Hogar',
      'ja': '家',
      'ru': 'Дом',
    },
  },
  // MainNavigatorPage2
  {
    'bf5ij9cc': {
      'en': 'POINT INFORMATION',
      'ar': 'معلومات النقطة',
      'es': 'INFORMACIÓN DEL PUNTO',
      'ja': 'ポイント情報',
      'ru': 'ИНФОРМАЦИЯ О ПУНКТАХ',
    },
    'p1w1h31l': {
      'en': 'Home',
      'ar': 'مسكن',
      'es': 'Hogar',
      'ja': '家',
      'ru': 'Дом',
    },
  },
  // MainNavigatorPagePlaceInfo
  {
    'pbolbx7o': {
      'en': 'POINT INFORMATION',
      'ar': 'معلومات النقطة',
      'es': 'INFORMACIÓN DEL PUNTO',
      'ja': 'ポイント情報',
      'ru': 'ИНФОРМАЦИЯ О ПУНКТАХ',
    },
    'o1d3a07q': {
      'en': 'Home',
      'ar': 'مسكن',
      'es': 'Hogar',
      'ja': '家',
      'ru': 'Дом',
    },
  },
  // MainNavigatorPageFinish
  {
    'lm18fn7u': {
      'en': 'ФИНИШ',
      'ar': 'ФИНИШ',
      'es': 'ФИНИШ',
      'ja': 'ФИНИШ',
      'ru': 'ФИНИШ',
    },
    'kiuoxc9a': {
      'en': 'ИНФОРМАЦИЯ О МЕСТЕ',
      'ar': 'ИНФОРМАЦИЯ О МЕСТЕ',
      'es': 'ИНФОРМАЦИЯ О МЕСТЕ',
      'ja': 'ИНФОРМАЦИЯ О МЕСТЕ',
      'ru': 'ИНФОРМАЦИЯ О МЕСТЕ',
    },
    '5arc7cyt': {
      'en': 'Home',
      'ar': 'مسكن',
      'es': 'Hogar',
      'ja': '家',
      'ru': 'Дом',
    },
  },
  // TripFinish
  {
    '60w182x5': {
      'en':
          'Ваше путешествие окончено.  Надеемся оно прошло прекрасно и вам понравился выбранный маршрут.',
      'ar':
          'аше путешествие окончено. адеемся оно прошло прекрасно и вам понравился выбранный маршрут.',
      'es':
          'Ваше путешествие окончено. Надеемся оно прошло прекрасно и вам понравился выбранный маршрут.',
      'ja':
          'よくある質問です。 Надеемся оно прошло прекрасно と вам понравился выбранный маршрут.',
      'ru':
          'Ваше окончено путешествие. Мы предполагаем, что он прошел прекрасно и понравился вам выбранный маршрут.',
    },
    'c1gc858g': {
      'en':
          'Если у вас есть какие-то пожелания или замечания, будем рады, если вы напишите нам на почту contact@twid.com',
      'ar':
          'усли у вас есть какие-то пожелания или замечания، будем рады، если вы напишите нам на почту contact@twid.com',
      'es':
          'Если у вас есть какие-то пожелания или замечания, будем рады, если вы напишите нам на почту contact@twid.com',
      'ja': 'お問い合わせはこちら contact@twid.com',
      'ru':
          'Если у вас есть какие-то пожелания или замечания, будем рады, если вы напишите нам на почту contact@twid.com',
    },
    'enga795w': {
      'en': 'НАЧАТЬ ПУТЕШЕСТВИЕ',
      'ar': 'АЧАТЬ ПУТЕШЕСТВИЕ',
      'es': 'НАЧАТЬ ПУТЕШЕСТВИЕ',
      'ja': 'НАЧАТЬ ПУТЕШЕСТВИЕ',
      'ru': 'НАЧАТЬ ПУТЕШЕСТВИЕ',
    },
    'tjf8529p': {
      'en': 'Вы проехали 3260 км. ',
      'ar': 'Вы проехали 3260 км.',
      'es': 'Вы проехали 3260 км.',
      'ja': '3260 km です。',
      'ru': 'Вы проехали 3260 км.',
    },
    'mu0hqk53': {
      'en': 'Получена ачивка «Путешественник»',
      'ar': 'Получена ачивка «утешественник»',
      'es': 'Получена ачивка «Путешественник»',
      'ja': 'Получена ачивка «Путешественник»',
      'ru': 'Получена ачивка «Путешественник»',
    },
    'b6np5bk2': {
      'en': 'Доступны новые маршруты',
      'ar': 'оступны новые маршруты',
      'es': 'Доступны новые маршруты',
      'ja': 'Доступны новые маршруты',
      'ru': 'Доступны новые маршруты',
    },
    '461vgj7g': {
      'en': 'Прокод на скидку 15% — twidrive',
      'ar': 'Прокод на скидку 15٪ - twidrive',
      'es': 'Precio de venta al público 15 % — twidrive',
      'ja': '15% — twidrive',
      'ru': 'Прокод на скидку 15% — twidrive',
    },
    'xklsqefy': {
      'en': 'Как забрать машину',
      'ar': 'Как забрать машину',
      'es': 'Как забрать машину',
      'ja': 'Как забрать машину',
      'ru': 'Как забрать машину',
    },
    'it29tisu': {
      'en': 'ВЕРНУТЬСЯ К МАРШРУТУ',
      'ar': 'ВЕРНУТЬСЯ К АРШРУТУ',
      'es': 'ВЕРНУТЬСЯ К МАРШРУТУ',
      'ja': 'ВЕРНУТЬСЯКМАРШРУТУ',
      'ru': 'ВЕРНУТЬСЯ К МАРШРУТУ',
    },
    'sp0ifsrs': {
      'en': 'Home',
      'ar': 'مسكن',
      'es': 'Hogar',
      'ja': '家',
      'ru': 'Дом',
    },
  },
  // TripFinish2
  {
    'n2heetyi': {
      'en': 'НАЧАТЬ НОВОЕ \nПУТЕШЕСТВИЕ',
      'ar': 'АЧАТЬ НОВОЕ\nПУТЕШЕСТВИЕ',
      'es': 'НАЧАТЬ НОВОЕ\nПУТЕШЕСТВИЕ',
      'ja': 'НАЧАТЬ НОВОЕ\nПУТЕШЕСТВИЕ',
      'ru': 'НАЧАТЬ НОВОЕ\nПУТЕШЕСТВИЕ',
    },
    'f56kaj7j': {
      'en':
          'Чтобы не пропустить интересные маршруты, новые машины, ачивки, или горячие предложения подписывайтесь на соцсети twid!',
      'ar':
          'كلمات بمعنى: тобы не пропустить интересные маршруты ، новые машины ، или горячие предложения подсывсы!',
      'es':
          'Чтобы не пропусти интереререные маршруты, новые машины, ачивки, или гие пре principal н.',
      'ja': '私はあなたのことをよく知っていません.',
      'ru':
          'Чтобы не пропустить интересные маршруты, новые машины, ачивки, или горячие предложения подписывайтесь на соцсети twid!',
    },
    '2rovny6s': {
      'en': 'Home',
      'ar': 'مسكن',
      'es': 'Hogar',
      'ja': '家',
      'ru': 'Дом',
    },
  },
  // CALENDAR
  {
    '5bul3epj': {
      'en':
          'Ваше путешествие начнется 10 октября в 11:00 в Кабо да Рока и закончится 12 октября в Назаре. ',
      'ar':
          'аше путешествие начнется 10 октября в 11:00 в або да Рока и закончится 12 октября в Назаре.',
      'es':
          'Ваше путешествие начнется 10 октября в 11:00 в Кабо да Рока и закончится 12 октября в Назаре.',
      'ja': '午前 10 時から午後 11 時まで、午前 12 時から午前 12 時までです。',
      'ru':
          'Ваше путешествие начнется 10 октября в 11:00 в Кабо да Рока и закончится 12 октября в Назаре.',
    },
    '15wx4hjx': {
      'en':
          'Для вас забронирован двухместный номер в отеле Belmond Delux в городе Тратата. Заселение в отель 11 октября в 20:00, чекаут 12 октября в 12:00. В проживание включен завтрак.',
      'ar':
          'ля вас забронирован двухместный номер в отеле Belmond Delux в городе Тратата. Заселение в отель 11 октября в 20:00، екаут 12 октября в 12:00. В проживание включен завтрак.',
      'es':
          'Для вас забронирован двухместный номер в отеле Belmond Delux в городе Тратата. Hasta el 11 de octubre a las 20:00, hasta el 12 de octubre a las 12:00. В проживание включен завтрак.',
      'ja':
          '現在はベルモンド デラックスが発売中です。月曜日 11 日 20:00、12 日 12:00 です。 В проживание включен завтрак.',
      'ru':
          'Для вас забронирован двухместный номер в отеле Belmond Delux в городе Тратата. Заселение в отель 11 октября в 20:00, чекаут 12 октября в 12:00. В проживание включен завтрак.',
    },
    'ijy45luh': {
      'en': 'Установить напоминание',
      'ar': 'Установить напоминание',
      'es': 'Установить напоминание',
      'ja': 'Установить напоминание',
      'ru': 'Установить на память',
    },
    'aiihtg6z': {
      'en': 'BACK',
      'ar': 'الى الخلف',
      'es': 'ESPALDA',
      'ja': '戻る',
      'ru': 'НАЗАД',
    },
    'jlw6qz3b': {
      'en': 'Home',
      'ar': 'مسكن',
      'es': 'Hogar',
      'ja': '家',
      'ru': 'Дом',
    },
  },
  // CAR
  {
    'se982brr': {
      'en': 'PORSCHE',
      'ar': 'بورش',
      'es': 'PORSCHE',
      'ja': 'ポルシェ',
      'ru': 'ПОРШЕ',
    },
    '4itqy889': {
      'en': '911 CARRERA GTS',
      'ar': '911 CARRERA GTS',
      'es': '911 CARRERA GTS',
      'ja': '911カレラGTS',
      'ru': '911 КАРРЕРА ГТС',
    },
    '73d3z6ux': {
      'en':
          'The Porsche 911 has 2 Petrol Engine on offer. It is available with Manual & Automatic transmission. The 911 is a 4 seater 6 cylinder car and has length of 4519 mm, width of 1852 mm and a wheelbase of 2450 mm.',
      'ar':
          'بورش 911 بها محركان يعملان بالبنزين. وهي متوفرة بناقل حركة يدوي وأوتوماتيكي. 911 هي سيارة ذات 4 مقاعد و 6 سلندر ويبلغ طولها 4519 ملم وعرضها 1852 ملم وقاعدة عجلاتها 2450 ملم.',
      'es':
          'El Porsche 911 tiene 2 motores de gasolina en oferta. Está disponible con transmisión manual y automática. El 911 es un automóvil de 4 plazas y 6 cilindros y tiene una longitud de 4519 mm, una anchura de 1852 mm y una distancia entre ejes de 2450 mm.',
      'ja':
          'ポルシェ 911 には 2 つのガソリン エンジンが搭載されています。手動および自動変速機で利用できます。 911 は 4 人乗りの 6 気筒車で、全長 4519 mm、全幅 1852 mm、ホイールベース 2450 mm です。',
      'ru':
          'Porsche 911 предлагает 2 бензиновых двигателя. Он доступен с механической и автоматической коробкой передач. Модель 911 представляет собой 4-местный 6-цилиндровый автомобиль длиной 4519 мм, шириной 1852 мм и колесной базой 2450 мм.',
    },
    'ejghvpv0': {
      'en': 'Fuel Type ',
      'ar': 'نوع الوقود',
      'es': 'Tipo de combustible',
      'ja': '燃料タイプ',
      'ru': 'Тип топлива',
    },
    'zn9mef4k': {
      'en': 'Petrol',
      'ar': 'بنزين',
      'es': 'Gasolina',
      'ja': 'ガソリン',
      'ru': 'Бензин',
    },
    'dezaokwk': {
      'en': 'Max Power (bhp@rpm)',
      'ar': 'أقصى قوة (bhp @ rpm)',
      'es': 'Potencia máxima (bhp@rpm)',
      'ja': '最大出力 (bhp@rpm)',
      'ru': 'Максимальная мощность (л.с. при об/мин)',
    },
    'fte8qpws': {
      'en': '641.00bhp@6500',
      'ar': '641.00bhp@6500',
      'es': '641.00bhp@6500',
      'ja': '641.00bhp@6500',
      'ru': '641,00 л.с. при 6500',
    },
    'qfav8hk6': {
      'en': 'Seating Capacity',
      'ar': 'سعة الجلوس',
      'es': 'Número de plazas',
      'ja': '座席定員',
      'ru': 'Количество сидячих мест',
    },
    '5d25xzjn': {
      'en': '2',
      'ar': '2',
      'es': '2',
      'ja': '2',
      'ru': '2',
    },
    '3frqgzej': {
      'en': 'Transmission Type',
      'ar': 'نوع التحويل',
      'es': 'Tipo de transmisión',
      'ja': '伝送タイプ',
      'ru': 'Тип передачи',
    },
    'r5lepaf7': {
      'en': 'Automatic',
      'ar': 'تلقائي',
      'es': 'Automático',
      'ja': '自動',
      'ru': 'автоматический',
    },
    'ibx5jke2': {
      'en': 'Tank Capacity',
      'ar': 'سعة الخزان',
      'es': 'Capacidad del tanque',
      'ja': 'タンク容量',
      'ru': 'Емкость бака',
    },
    'b599lfqg': {
      'en': '64.0',
      'ar': '64.0',
      'es': '64.0',
      'ja': '64.0',
      'ru': '64,0',
    },
    'iddzjb26': {
      'en': 'Перед началом путешествия машина заправлена до полного бака.',
      'ar': 'еред началом путешествия машина заправлена до полного бака.',
      'es': 'Перед началом путешествия машина заправлена до полного бака.',
      'ja': 'すでに、この問題が解決されていません。',
      'ru': 'Перед началом путешествия машина заправлена до полного бака.',
    },
    'ar9hcqzj': {
      'en': 'BACK',
      'ar': 'الى الخلف',
      'es': 'ESPALDA',
      'ja': '戻る',
      'ru': 'НАЗАД',
    },
    'ob7w7y5l': {
      'en': 'Home',
      'ar': 'مسكن',
      'es': 'Hogar',
      'ja': '家',
      'ru': 'Дом',
    },
  },
  // AboutPlace
  {
    'stgexjii': {
      'en': 'Cabo da Roca — Nazare. Portugal',
      'ar': 'كابو دا روكا - نازاري. البرتغال',
      'es': 'Cabo da Roca — Nazaré. Portugal',
      'ja': 'カボ ダ ロカ — ナザレ。ポルトガル',
      'ru': 'Кабо да Рока — Назаре. Португалия',
    },
    'a0jpj9v9': {
      'en': '10 октября — 12 октября, 2022',
      'ar': '10 октября - 12 октября، 2022',
      'es': '10 de octubre — 12 de octubre, 2022',
      'ja': '2022 年 10 月 10 日 — 12 日',
      'ru': '10 октября — 12 октября 2022 г.',
    },
    '5yrehsu0': {
      'en': 'Porsche 911 Carrera GTS',
      'ar': 'بورش 911 كاريرا جي تي إس',
      'es': 'Porsche 911 Carrera GTS',
      'ja': 'ポルシェ 911 カレラ GTS',
      'ru': 'Порше 911 Каррера ГТС',
    },
    '8q31xc2m': {
      'en': 'CABO DA ROCE',
      'ar': 'CABO DA ROCE',
      'es': 'CABO DA ROCE',
      'ja': 'CABO DA ROCE',
      'ru': 'КАБО ДА РОЧЕ',
    },
    '4glnwve2': {
      'en':
          'Libero et saepe ipsa cum. Recusandae aut nostrum odit rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Esse officiis inventore voluptates inventore adipisci itaque nostrum. Repudiandae ea et modi veniam.',
      'ar':
          'Libero et saepe ipsa cum. Recusandae aut nostrum odit rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores سايب طارد. Esse officiis يخترع voluptates يخترع adipisci itaque nostrum. Repudiandae ea et modi veniam.',
      'es':
          'Líbero et saepe ipsa cum. Recusandae aut nostrum odit rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Esse officiis inventore voluptates inventore adipisci itaque nostrum. Repudiandae ea et modi veniam.',
      'ja':
          'Libero et saepe ipsa cum. Recusandae aut nostrum od rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat。 Esse officiis Inventorye voluptates Inventory adipisci itaque nostrum. Repudiandae ea et modi veniam.',
      'ru':
          'Либеро и др saepe ipsa диплом. Recusandae aut nostrum odit rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Esse officiis Inventore voluptates Inventure adipisci itaque nostrum. Repudiandae ea et modi veniam.',
    },
    'wc13eicg': {
      'en': 'Home',
      'ar': 'مسكن',
      'es': 'Hogar',
      'ja': '家',
      'ru': 'Дом',
    },
  },
  // TakeaCar
  {
    '6svfki8i': {
      'en': 'Как забрать машину?',
      'ar': 'Как забрать машину؟',
      'es': 'Как забрать машину?',
      'ja': 'Как забрать машину?',
      'ru': 'Как забрать машину?',
    },
    '6ssfhhxv': {
      'en': '1.',
      'ar': '1.',
      'es': '1.',
      'ja': '1.',
      'ru': '1.',
    },
    'u7nhlxdg': {
      'en':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ar':
          'Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'es':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ja':
          'Qui execitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ru':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
    },
    'fdj7mntn': {
      'en': '2.',
      'ar': '2.',
      'es': '2.',
      'ja': '2.',
      'ru': '2.',
    },
    '5u4e5qvb': {
      'en':
          'Qui exercitationem esse nisi neque. Culpa  atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ar':
          'Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'es':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ja':
          'Qui execitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ru':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
    },
    'b9quzzbu': {
      'en': '3.',
      'ar': '3.',
      'es': '3.',
      'ja': '3.',
      'ru': '3.',
    },
    '99k6tb6g': {
      'en':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ar':
          'Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'es':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ja':
          'Qui execitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ru':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
    },
    'au7ammyh': {
      'en': '4.',
      'ar': '4.',
      'es': '4.',
      'ja': '4.',
      'ru': '4.',
    },
    'xed7h1y4': {
      'en':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ar':
          'Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'es':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ja':
          'Qui execitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ru':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
    },
    'umam7q00': {
      'en': 'Как вернуть машину?',
      'ar': 'Как вернуть машину؟',
      'es': 'Как вернуть машину?',
      'ja': 'Как вернуть машину?',
      'ru': 'Как вернуть машину?',
    },
    'eqq3go5j': {
      'en': '1.',
      'ar': '1.',
      'es': '1.',
      'ja': '1.',
      'ru': '1.',
    },
    'g0otsgq7': {
      'en':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ar':
          'Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'es':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ja':
          'Qui execitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ru':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
    },
    'u9qkifgy': {
      'en': '2.',
      'ar': '2.',
      'es': '2.',
      'ja': '2.',
      'ru': '2.',
    },
    '76idyil3': {
      'en':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ar':
          'Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'es':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ja':
          'Qui execitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ru':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
    },
    '82oj8u5k': {
      'en': '3.',
      'ar': '3.',
      'es': '3.',
      'ja': '3.',
      'ru': '3.',
    },
    'gugd0pvv': {
      'en':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ar':
          'Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'es':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ja':
          'Qui execitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ru':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
    },
    'a7jpg6lr': {
      'en': 'Home',
      'ar': 'مسكن',
      'es': 'Hogar',
      'ja': '家',
      'ru': 'Дом',
    },
  },
  // Settings
  {
    '7plcb94k': {
      'en': 'НАСТРОЙКИ',
      'ar': 'НАСТРОЙКИ',
      'es': 'НАСТРОЙКИ',
      'ja': 'НАСТРОЙКИ',
      'ru': 'НАСТРОЙКИ',
    },
    '16gdwltg': {
      'en': 'ВЫБОР ЯЗЫКА ПРИЛОЖЕНИЯ',
      'ar': 'ВЫБОР ЯЗЫКА ПРИЛОЖЕНИЯ',
      'es': 'ВЫБОР ЯЗЫКА ПРИЛОЖЕНИЯ',
      'ja': 'ВЫБОР ЯЗЫКА ПРИЛОЖЕНИЯ',
      'ru': 'ВЫБОР ЯЗЫКА ПРИЛОЖЕНИЯ',
    },
    '6jozw576': {
      'en': 'Английский',
      'ar': 'Английский',
      'es': 'Inglés',
      'ja': 'Английский',
      'ru': 'английский',
    },
    'fa0r9lig': {
      'en': 'Русский',
      'ar': 'Русский',
      'es': 'Русский',
      'ja': 'Русский',
      'ru': 'Русский',
    },
    'eliae8ow': {
      'en': 'Испанский',
      'ar': 'спанский',
      'es': 'español',
      'ja': 'Испанский',
      'ru': 'Испанский',
    },
    'tut5rnqw': {
      'en': 'Японский',
      'ar': 'Японский',
      'es': 'Японский',
      'ja': 'Японский',
      'ru': 'Японский',
    },
    'gqkc77hj': {
      'en': 'Арабский',
      'ar': 'Арабский',
      'es': 'árabe',
      'ja': 'Арабский',
      'ru': 'арабский',
    },
    'a5uwsc6g': {
      'en': 'ЗВУКОВЫЕ ПОДСКАЗКИ',
      'ar': 'ЗВУКОВЫЕ СКАЗКИ',
      'es': 'ЗВУКОВЫЕ ПОДСКАЗКИ',
      'ja': 'ЗВУКОВЫЕ ПОДСКАЗКИ',
      'ru': 'ЗВУКОВЫЕ ПОДСКАЗКИ',
    },
    '9qd8062v': {
      'en': 'Включить',
      'ar': 'ключить',
      'es': 'Включить',
      'ja': 'ヴァクラホマシトフ',
      'ru': 'Включить',
    },
    'o6t7q7lo': {
      'en': 'Выключить',
      'ar': 'Выключить',
      'es': 'Выключить',
      'ja': 'Выключить',
      'ru': 'Выключить',
    },
    'e274okr1': {
      'en': 'ВИД НАВИГАТОРА',
      'ar': 'ВИД АВИГАТОРА',
      'es': 'ВИД НАВИГАТОРА',
      'ja': 'ВИДНАВИГАТОРА',
      'ru': 'ВИД НАВИГАТОРА',
    },
    '4eezqmjj': {
      'en': 'Светлый',
      'ar': 'Светлый',
      'es': 'Светлый',
      'ja': 'Светлый',
      'ru': 'Светлый',
    },
    'm1dh6uwm': {
      'en': 'Темный',
      'ar': 'емный',
      'es': 'Темный',
      'ja': 'Темный',
      'ru': 'Темный',
    },
    's7zcsmgi': {
      'en': 'ЭКСТРЕННЫЙ ВЫЗОВ',
      'ar': 'ЭКСТРЕННЫЙ ВЫЗОВ',
      'es': 'ЭКСТРЕННЫЙ ВЫЗОВ',
      'ja': 'ЭКСТРЕННЫЙ ВЫЗОВ',
      'ru': 'ЭКСТРЕННЫЙ ВЫЗОВ',
    },
  },
  // Help
  {
    'n8v2kdkb': {
      'en': 'Задать вопрос',
      'ar': 'Задать вопрос',
      'es': 'Задать вопрос',
      'ja': 'Задать вопрос',
      'ru': 'Задать вопрос',
    },
    'xyqcahji': {
      'en': 'КАК ИСПОЛЬЗОВАТЬ ПРИЛОЖЕНИЕ',
      'ar': 'КАК ИСПОЛЬЗОВАТЬ ПРИЛОЖЕНИЕ',
      'es': 'КАК ИСПОЛЬЗОВАТЬ ПРИЛОЖЕНИЕ',
      'ja': 'КАК ИСПОЛЬЗОВАТЬ ПРИЛОЖЕНИЕ',
      'ru': 'КАК ИСПОЛЬЗОВАТЬ ПРИЛОЖЕНИЕ',
    },
    'm1wetc6o': {
      'en':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ar':
          '1. Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'es':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ja':
          '1. Qui execitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ru':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
    },
    '25264jzx': {
      'en': 'ИНФОРМАЦИЯ О НАВИГАТОРЕ',
      'ar': 'ИНФОРМАЦИЯ О АВИГАТОРЕ',
      'es': 'ИНФОРМАЦИЯ О НАВИГАТОРЕ',
      'ja': 'ИНФОРМАЦИЯ О НАВИГАТОРЕ',
      'ru': 'ИНФОРМАЦИЯ О НАВИГАТОРЕ',
    },
    'kdf4vzqq': {
      'en':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ar':
          '1. Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'es':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ja':
          '1. Qui execitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ru':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
    },
    '4bo2nc9i': {
      'en': 'КАК ЗАБРАТЬ МАШИНУ',
      'ar': 'КАК ЗАБРАТЬ АШИНУ',
      'es': 'КАК ЗАБРАТЬ МАШИНУ',
      'ja': 'КАК ЗАБРАТЬ МАШИНУ',
      'ru': 'КАК ЗАБРАТЬ МАШИНУ',
    },
    '9zllze7o': {
      'en':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ar':
          '1. Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'es':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ja':
          '1. Qui execitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ru':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
    },
    'teqxns7s': {
      'en': 'КАК ВЕРНУТЬ МАШИНУ',
      'ar': 'КАК ВЕРНУТЬ АШИНУ',
      'es': 'КАК ВЕРНУТЬ МАШИНУ',
      'ja': 'КАК ВЕРНУТЬ МАШИНУ',
      'ru': 'КАК ВЕРНУТЬ МАШИНУ',
    },
    'vw2rgm6j': {
      'en':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ar':
          '1. Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'es':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ja':
          '1. Qui execitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ru':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
    },
    'lue0b4ly': {
      'en': 'ПРАВИЛА ИСПОЛЬЗОВАНИЯ АВТОМОБИЛЯ',
      'ar': 'ПРАВИЛА ИСПОЛЬЗОВАНИЯ АВТОМОБИЛЯ',
      'es': 'ПРАВИЛА ИСПОЛЬЗОВАНИЯ АВТОМОБИЛЯ',
      'ja': 'ПРАВИЛА ИСПОЛЬЗОВАНИЯ АВТОМОБИЛЯ',
      'ru': 'ПРАВИЛА ИСПОЛЬЗОВАНИЯ АВТОМОБИЛЯ',
    },
    '3l9ry3b7': {
      'en':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ar':
          '1. Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'es':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ja':
          '1. Qui execitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ru':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
    },
    'pzfzjigy': {
      'en': 'ПРАВИЛА ПОЛЬЗОВАНИЯ БРОНЬЮ В ОТЕЛЕ',
      'ar': 'ПРАВИЛА ПОЛЬЗОВАНИЯ БРОНЬЮ В ОТЕЛЕ',
      'es': 'ПРАВИЛА ПОЛЬЗОВАНИЯ БРОНЬЮ В ОТЕЛЕ',
      'ja': 'ПРАВИЛА ПОЛЬЗОВАНИЯ БРОНЬЮ В ОТЕЛЕ',
      'ru': 'ПРАВИЛА ПОЛЗОВАНИЯ БРОНЬЮ В ОТЕЛЕ',
    },
    'fi6x7k2f': {
      'en':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ar':
          '1. Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'es':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ja':
          '1. Qui execitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ru':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
    },
    '22lgbxln': {
      'en': 'СТРАХОВАНИЕ ОТВЕТСТВЕННОСТИ',
      'ar': 'СТРАХОВАНИЕ ОТВЕТСТВЕННОСТИ',
      'es': 'СТРАХОВАНИЕ ОТВЕТСТВЕННОСТИ',
      'ja': 'СТРАХОВАНИЕ ОТВЕТСТВЕННОСТИ',
      'ru': 'СТРАХОВАНИЕ ОТВЕТСТВЕННОСТИ',
    },
    'ohgejlab': {
      'en':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ar':
          '1. Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'es':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ja':
          '1. Qui execitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ru':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
    },
    'tr5bmiz0': {
      'en': 'ЗАДАТЬ ВОПРОС',
      'ar': 'ЗАДАТЬ ВОПРОС',
      'es': 'ЗАДАТЬ ВОПРОС',
      'ja': 'ЗАДАТЬ ВОПРОС',
      'ru': 'ЗАДАТЬ ВОПРОС',
    },
  },
  // Questions
  {
    'a1n3jhbi': {
      'en': 'Задать вопрос',
      'ar': 'Задать вопрос',
      'es': 'Задать вопрос',
      'ja': 'Задать вопрос',
      'ru': 'Задать вопрос',
    },
    '97l7zg5g': {
      'en': 'Ваше имя',
      'ar': 'Ваше имя',
      'es': 'Ваше имя',
      'ja': 'よくある質問',
      'ru': 'Ваше имя',
    },
    'rak6fjv6': {
      'en': 'Email',
      'ar': 'البريد الإلكتروني',
      'es': 'Correo electrónico',
      'ja': 'Eメール',
      'ru': 'Эл. адрес',
    },
    'u9oeq7w1': {
      'en': 'Начните писать',
      'ar': 'ачните писать',
      'es': 'Начните писать',
      'ja': 'Начните писать',
      'ru': 'владение письмом',
    },
    'wxepaaij': {
      'en': 'SEND',
      'ar': 'إرسال',
      'es': 'ENVIAR',
      'ja': '送信',
      'ru': 'ОТПРАВИТЬ',
    },
    '1hd7ebwe': {
      'en': 'Ответ на ваш вопрос мы отправим на e-mail',
      'ar': 'Ответ на ваш вопрос мы отправим на البريد الإلكتروني',
      'es': 'Ответ на ваш вопрос мы отправим на e-mail',
      'ja': 'メールでお問い合わせください',
      'ru': 'Ответ на ваш вопрос мы отправляем на e-mail',
    },
    'wsofpb41': {
      'en': 'Home',
      'ar': 'مسكن',
      'es': 'Hogar',
      'ja': '家',
      'ru': 'Дом',
    },
  },
  // SUPPORT
  {
    'vqz0mtym': {
      'en': 'СЛУЖБА ПОДДЕРЖКИ',
      'ar': 'СЛУЖБА ПОДДЕРЖКИ',
      'es': 'СЛУЖБА ПОДДЕРЖКИ',
      'ja': 'СЛУЖБА ПОДДЕРЖКИ',
      'ru': 'СЛУЖБА ПОДДЕРЖКИ',
    },
    'l0ff1ngm': {
      'en': 'СПАСИБО',
      'ar': 'СПАСИБО',
      'es': 'СПАСИБО',
      'ja': 'СПАСИБО',
      'ru': 'СПАСИБО',
    },
    'f25pvfm9': {
      'en':
          'Валерий, здравствуйте! Спасибо, что обратились в службу поддержки. Мы постараемся ответить на ваш вопрос как можно быстрее и пришлем ответ вам на почту. ',
      'ar':
          'алерий، здравствуйте! Спасибо ، обратились в службу поддержки. ы постараемся ответить на ваш вопрос как можно быстрее и пришлем ответ вам на почту.',
      'es':
          'Валерий, здравствуйте! Спасибо, что обратились в службу поддержки. ¿Qué puedo hacer?',
      'ja':
          '大切にします！ Спасибо, что обратились в службу поддержки. Мы постараемся ответить на ваш вопрос как можно быстрее および пришлет вам на почту.',
      'ru':
          'Валерий, здравствуйте! Спасибо, что обратились в службу поддержки. Мы постараемся ответить на ваш вопрос как можно быстрее и пришлем ответ вам на почту.',
    },
    'ddyicczm': {
      'en': 'OK',
      'ar': 'نعم',
      'es': 'OK',
      'ja': 'わかった',
      'ru': 'ХОРОШО',
    },
    'ujxr0zqq': {
      'en': 'Home',
      'ar': 'مسكن',
      'es': 'Hogar',
      'ja': '家',
      'ru': 'Дом',
    },
  },
  // search
  {
    '1nw9pklc': {
      'en': 'OK',
      'ar': 'نعم',
      'es': 'OK',
      'ja': 'わかった',
      'ru': 'ХОРОШО',
    },
  },
  // Miscellaneous
  {
    'innpeagl': {
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
    '9xerdrne': {
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
    'se7vxgf1': {
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
    'gp16g5ez': {
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
    'gjtl5hwc': {
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
    'c2yfo6vb': {
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
    'nm8ajz7e': {
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
    '5brpwvu3': {
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
    '17nqubbu': {
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
    'ob8k3ox2': {
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
    's7lstziv': {
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
    '0ajd038e': {
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
    'odlv0s08': {
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
    '31le5rl2': {
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
    'zgsqy388': {
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
    'xw588pyc': {
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
    'xitmwstb': {
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
    '24pnytp0': {
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
    '6kiehx04': {
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
    '4w8rb4v9': {
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
    'ppezs9d7': {
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
  },
].reduce((a, b) => a..addAll(b));
