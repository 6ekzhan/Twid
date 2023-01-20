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
    '5tzuumc9': {
      'en': 'OK',
      'ar': 'OK',
      'es': 'OK',
      'ja': 'OK',
      'ru': 'OK',
    },
    'Извините, но такого номера бронирования не существует': {
      'en': 'Sorry, but there is no such booking number',
      'ar': 'عذرا ، ولكن لا يوجد رقم الحجز هذا',
      'es': 'Lo sentimos, no existe tal número de reserva',
      'ja': '申し訳ありませんが、そのような予約番号はありません',
      'ru': 'Извините, но такого номера бронирования не существует',
    },
    'ai2vnv38': {
      'en': 'If you have not yet chosen a route to travel,',
      'ar': 'إذا لم تكن قد اخترت طريقا',
      'es': 'Si aún no ha elegido una ruta para viajar,',
      'ja': '旅行するルートをまだ選択していない場合は、',
      'ru': 'Если вы еще не выбрали маршрут для путешествия',
    },
    'site': {
      'en': ' go to the website',
      'ar': ' للسفر بعد ، فانتقل إلى موقع الويب',
      'es': ' vaya al sitio web',
      'ja': ' ウェブサイトにアクセスしてください',
      'ru': ' перейдите на сайт',
    },
    '6i1j2l2u': {
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
      'en': 'Your journey will begin in:',
      'ar': 'سوف تبدأ رحلتك في:',
      'es': 'Su viaje comenzará a través de:',
      'ja': 'あなたの旅はで始まります:',
      'ru': 'Ваше путешествие начнется через:',
    },
    'hy6dw4ym': {
      'en': 'Porsche 911 Carrera GTS',
      'ar': 'Porsche 911 Carrera GTS',
      'es': 'Porsche 911 Carrera GTS',
      'ja': 'Porsche 911 Carrera GTS',
      'ru': 'Porsche 911 Carrera GTS',
    },
    'wzbafwa9': {
      'en': 'October 10 — October 12, 2022',
      'ar': '10 أكتوبر-12 أكتوبر 2022',
      'es': '10 octubre — 12 octubre, 2022',
      'ja': '2022年10月10日—10月12日',
      'ru': '10 октября — 12 октября 2022 г.',
    },
    '7ho7tok1': {
      'en': 'Cabo da Roca — Nazare. Portugal',
      'ar': 'Cabo da Roca — Nazare. Portugal',
      'es': 'Cabo da Roca — Nazare. Portugal',
      'ja': 'Cabo da Roca — Nazare. Portugal',
      'ru': 'Cabo da Roca — Nazare. Portugal',
    },
    'u8lwwu0t': {
      'en': 'More journey details',
      'ar': 'More journey details',
      'es': 'More journey details',
      'ja': 'More journey details',
      'ru': 'More journey details',
    },
    'ocefep6i': {
      'en': 'How to pick up the car?',
      'ar': 'كيفية التقاط السيارة?',
      'es': '¿Cómo recoger el coche?',
      'ja': 'どのように車を拾うには？',
      'ru': 'Как забрать машину?',
    },
    '44rr2ku7': {
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
  },
  // Instructions010
  {
    'scniofx1': {
      'en': 'PLEASE READ THE RULES',
      'ar': 'يرجى قراءة القواعد',
      'es': 'POR FAVOR, LEA LAS REGLAS',
      'ja': 'ルールをお読みください',
      'ru': 'ПОЖАЛУЙСТА, ОЗНАКОМЬТЕСЬ С ПРАВИЛАМИ',
    },
    'sxcy9gwi': {
      'en': 'RULES FOR USING THE CAR',
      'ar': 'قواعد استخدام السيارة',
      'es': 'REGLAS DE USO DEL VEHÍCULO',
      'ja': '車を使用するためのルール',
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
      'en': 'INSURANCE RULES',
      'ar': 'قواعد التأمين',
      'es': 'NORMAS DE SEGURO',
      'ja': '保険のルール',
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
      'en': 'RULES FOR USING HOTEL ARMOR',
      'ar': 'قواعد استخدام درع الفندق',
      'es': 'CONDICIONES DE USO DE LA RESERVA DEL HOTEL',
      'ja': 'ホテルの鎧を使用するためのルール',
      'ru': 'ПРАВИЛА ПОЛЬЗОВАНИЯ БРОНЬЮ ГОСТИНИЦЫ',
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
      'en': 'SAFETY RULES',
      'ar': 'قواعد السلامة',
      'es': 'REGLAS DE SEGURIDAD',
      'ja': '安全ルール',
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
      'en': 'EMERGENCY COMMUNICATION',
      'ar': 'الاتصالات في حالات الطوارئ',
      'es': 'COMUNICACIONES DE EMERGENCIA',
      'ja': '緊急連絡',
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
      'en': 'I READ IT. I AGREE',
      'ar': 'قرأته. أنا موافق',
      'es': 'LEYO. De acuerdo',
      'ja': '私はそれを読んだ。 賛成です。',
      'ru': 'ПРОЧИТАЛ. СОГЛАСЕН',
    },
    '8ckyk7t6': {
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
  },
  // Instructions010Copy
  {
    'zpvrsut8': {
      'en': 'PLEASE READ THE RULES',
      'ar': 'يرجى قراءة القواعد',
      'es': 'POR FAVOR, LEA LAS REGLAS',
      'ja': 'ルールをお読みください',
      'ru': 'ПОЖАЛУЙСТА, ОЗНАКОМЬТЕСЬ С ПРАВИЛАМИ',
    },
    'xayhmc8i': {
      'en': 'RULES FOR USING THE CAR',
      'ar': 'قواعد استخدام السيارة',
      'es': 'REGLAS DE USO DEL VEHÍCULO',
      'ja': '車を使用するためのルール',
      'ru': 'ПРАВИЛА ИСПОЛЬЗОВАНИЯ АВТОМОБИЛЯ',
    },
    'na0fn57l': {
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
    'zkidn2sm': {
      'en': 'INSURANCE RULES',
      'ar': 'قواعد التأمين',
      'es': 'NORMAS DE SEGURO',
      'ja': '保険のルール',
      'ru': 'ПРАВИЛА СТРАХОВАНИЯ',
    },
    'mhut3kz4': {
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
    'rsyyjrx7': {
      'en': 'RULES FOR USING HOTEL ARMOR',
      'ar': 'قواعد استخدام درع الفندق',
      'es': 'CONDICIONES DE USO DE LA RESERVA DEL HOTEL',
      'ja': 'ホテルの鎧を使用するためのルール',
      'ru': 'ПРАВИЛА ПОЛЬЗОВАНИЯ БРОНЬЮ ГОСТИНИЦЫ',
    },
    'mz5x3wjm': {
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
    'cmpdv71x': {
      'en': 'SAFETY RULES',
      'ar': 'قواعد السلامة',
      'es': 'REGLAS DE SEGURIDAD',
      'ja': '安全ルール',
      'ru': 'ПРАВИЛА БЕЗОПАСНОСТИ',
    },
    'bct0ixgr': {
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
    '8ern5csu': {
      'en': 'EMERGENCY COMMUNICATION',
      'ar': 'الاتصالات في حالات الطوارئ',
      'es': 'COMUNICACIONES DE EMERGENCIA',
      'ja': '緊急連絡',
      'ru': 'ЭКСТРЕННАЯ СВЯЗЬ',
    },
    'fop1i112': {
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
    '0bmeynk9': {
      'en': 'I READ IT. I AGREE',
      'ar': 'قرأته. أنا موافق',
      'es': 'LEYO. De acuerdo',
      'ja': '私はそれを読んだ。 賛成です。',
      'ru': 'ПРОЧИТАЛ. СОГЛАСЕН',
    },
    'dbhbsr11': {
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
  },
  // Trip2
  {
    'pz4ro1we': {
      'en':
          'The buttons on the navigator screen will help you navigate throughout the route. You can easily go from one destination to another or go back.',
      'ar':
          'ستساعدك الأزرار الموجودة على شاشة المستكشف على التنقل في جميع أنحاء الطريق. يمكنك الانتقال بسهولة من وجهة إلى أخرى أو العودة.',
      'es':
          'Los botones en la pantalla del navegador lo ayudarán a navegar a lo largo de la ruta. Puede pasar fácilmente de un punto de destino a otro o retroceder.',
      'ja':
          'ナビゲータ画面のボタンは、ルート全体をナビゲートするのに役立ちます。 ある目的地から別の目的地に簡単に移動したり、戻ったりすることができます。',
      'ru':
          'Кнопки на экране навигатора помогут вам ориентироваться на протяжении всего маршрута. Вы можете легко перейти от одной точки назначения к другой или вернуться назад.',
    },
    'vin93ofb': {
      'en': 'OK. NEXT',
      'ar': 'حسنا. التالي',
      'es': 'OK. SIGUIENTE',
      'ja': 'わかった 次へ',
      'ru': 'ОК. ДАЛЬШЕ',
    },
    'kuswjwgq': {
      'en':
          'Upon reaching a new point, the navigator will tell you about the availability of interesting information that we have carefully selected for you. Click Point Information.',
      'ar':
          'عند الوصول إلى نقطة جديدة ، سيخبرك المستكشف عن توفر المعلومات المثيرة للاهتمام التي اخترناها لك بعناية. انقر فوق معلومات النقطة.',
      'es':
          'Al llegar al nuevo punto, el navegador le indicará la presencia de información interesante, que hemos seleccionado cuidadosamente para usted. Haga Clic En Point Information.',
      'ja':
          '新しいポイントに到達すると、ナビゲータは慎重に選択した興味深い情報の入手可能性について教えてくれます。 ポイント情報をクリックします。',
      'ru':
          'По достижении новой точки навигатор подскажет о наличии интересной информации, которую мы для вас тщательно подобрали. Кликните Point Information. ',
    },
    'ncaulhea': {
      'en': 'OK. NEXT',
      'ar': 'حسنا. التالي',
      'es': 'OK. SIGUIENTE',
      'ja': 'わかった 次へ',
      'ru': 'ОК. ДАЛЬШЕ',
    },
    'c3bdx0kk': {
      'en':
          'Moving between points, you can find out in advance about the sights that lie on your route or return to the navigator.',
      'ar':
          'الانتقال بين النقاط ، يمكنك معرفة مقدما عن المعالم السياحية التي تقع على مسارك أو العودة إلى الملاح.',
      'es':
          'Al moverse entre puntos, puede conocer de antemano los puntos de interés que se encuentran en su ruta o regresar al navegador.',
      'ja': 'ポイント間を移動すると、ルート上にある観光スポットやナビゲーターに戻るスポットについて事前に知ることができます。',
      'ru':
          'Перемещаясь между точками, вы можете заранее узнать о достопримечательностях, которые лежат на вашем маршруте или вернуться в навигатор.',
    },
    'ioa7i7qj': {
      'en': 'OK. NEXT',
      'ar': 'حسنا. التالي',
      'es': 'OK. SIGUIENTE',
      'ja': 'わかった 次へ',
      'ru': 'ОК. ДАЛЬШЕ',
    },
    'lyh3zlw8': {
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
  },
  // TripStart
  {
    'tm8bffsz': {
      'en': 'START THE JOURNEY',
      'ar': 'ابدأ الرحلة',
      'es': 'COMIENCE SU VIAJE',
      'ja': '旅を始める',
      'ru': 'НАЧАТЬ ПУТЕШЕСТВИЕ',
    },
    'adl2jnc3': {
      'en': 'How to pick up the car?',
      'ar': 'كيفية التقاط السيارة?',
      'es': '¿Cómo recoger el coche?',
      'ja': 'どのように車を拾うには？',
      'ru': 'Как забрать машину?',
    },
    '6r478cgk': {
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
  },
  // MainNavigatorPage
  {
    'gnh6m1of': {
      'en': 'LET\'S GO!',
      'ar': 'لنذهب!',
      'es': '¡VAMOS!',
      'ja': '行くぞ!',
      'ru': 'ПОЕХАЛИ!',
    },
    'kfr798l2': {
      'en': 'LOCATION INFORMATION',
      'ar': 'معلومات الموقع',
      'es': 'INFORMACIÓN DEL LUGAR',
      'ja': '位置情報',
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
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
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
      'en': '',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
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
      'ar': 'بيت',
      'es': 'Casa',
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
      'ar': 'بيت',
      'es': 'Casa',
      'ja': '家',
      'ru': 'Дом',
    },
  },
  // MainNavigatorPageFinish
  {
    'lm18fn7u': {
      'en': 'FINISH',
      'ar': 'إنهاء',
      'es': 'LÍNEA DE LLEGADA',
      'ja': '仕上げ',
      'ru': 'ФИНИШ',
    },
    'kiuoxc9a': {
      'en': 'LOCATION INFORMATION',
      'ar': 'معلومات الموقع',
      'es': 'INFORMACIÓN DEL LUGAR',
      'ja': '位置情報',
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
          'Your journey is over.\nWe hope it went well and you liked the chosen route.',
      'ar':
          'رحلتك قد انتهت.\nنأمل أن سارت الأمور على ما يرام وكنت تحب الطريق المختار.',
      'es':
          'Su viaje ha terminado.\nEsperamos que haya ido bien y te haya gustado la ruta elegida.',
      'ja': 'あなたの旅は終わりました。\n私たちは、それがうまくいったとあなたが選択したルートが好き願っています。',
      'ru':
          'Ваше путешествие окончено.\nНадеемся оно прошло прекрасно и вам понравился выбранный маршрут.',
    },
    'c1gc858g': {
      'en':
          'If you have any suggestions or comments, we will be glad if you write to us by email contact@twid.com',
      'ar':
          'إذا كان لديك أي اقتراحات أو تعليقات ، سنكون سعداء إذا كنت تكتب لنا عن طريق البريد الإلكتروني contact@twid.com',
      'es':
          'Si tiene alguna sugerencia o comentario, estaremos encantados de enviarnos un correo electrónico contact@twid.com',
      'ja': '提案かコメントがあれば、私達は電子メールによって私達に書けば嬉しいですcontact@twid.com',
      'ru':
          'Если у вас есть какие-то пожелания или замечания, будем рады, если вы напишите нам на почту contact@twid.com',
    },
    'enga795w': {
      'en': 'START THE JOURNEY',
      'ar': 'ابدأ الرحلة',
      'es': 'COMIENCE SU VIAJE',
      'ja': '旅を始める',
      'ru': 'НАЧАТЬ ПУТЕШЕСТВИЕ',
    },
    'tjf8529p': {
      'en': 'You have driven 3260 km.',
      'ar': 'لقد دفعت 3260 كم.',
      'es': 'Has recorrido 3260 Km.',
      'ja': 'あなたは3260キロを運転しています。',
      'ru': 'Вы проехали 3260 км.',
    },
    'mu0hqk53': {
      'en': 'The \"Traveler\" achievement was received',
      'ar': 'تم استلام إنجاز \"المسافر\" ',
      'es': 'Recibido achivka \"Viajero\"',
      'ja': 'Traveler\"の実績が届きました',
      'ru': 'Получена ачивка «Путешественник»',
    },
    'b6np5bk2': {
      'en': 'New routes are available',
      'ar': 'طرق جديدة متاحة',
      'es': 'Nuevas rutas disponibles',
      'ja': '新しいルートが利用可能です',
      'ru': 'Доступны новые маршруты',
    },
    '461vgj7g': {
      'en': '15% discount promo code — twidrive',
      'ar': '15% خصم الرمز الترويجي-تويدريف',
      'es': 'Procode con un 15% de descuento-twidrive',
      'ja': '15%割引プロモーションコード—twidrive',
      'ru': 'Прокод на скидку 15% — twidrive',
    },
    'xklsqefy': {
      'en': 'How to pick up the car?',
      'ar': 'كيفية التقاط السيارة?',
      'es': '¿Cómo recoger el coche?',
      'ja': 'どのように車を拾うには？',
      'ru': 'Как забрать машину?',
    },
    'it29tisu': {
      'en': 'GO BACK TO THE ROUTE',
      'ar': 'العودة إلى الطريق',
      'es': 'VOLVER A LA RUTA',
      'ja': 'ルートに戻る',
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
      'en': 'START A NEW JOURNEY',
      'ar': 'ابدأ رحلة جديدة',
      'es': 'EMPIEZA UN NUEVO VIAJE',
      'ja': '新しい旅を始める',
      'ru': 'НАЧАТЬ НОВОЕ ПУТЕШЕСТВИЕ',
    },
    'f56kaj7j': {
      'en':
          'In order not to miss interesting routes, new cars, achievements, or hot offers, subscribe to twid social networks!',
      'ar':
          'حتى لا تفوت الطرق المثيرة للاهتمام أو السيارات الجديدة أو الإنجازات أو العروض الساخنة ، اشترك في شبكات التواصل الاجتماعي twid!',
      'es':
          '¡Para no perderse rutas interesantes, autos nuevos, logros u ofertas interesantes, suscríbase a las redes sociales twid!',
      'ja': '興味深いルート、新車、実績、またはお得なオファーを見逃さないように、twid ソーシャル ネットワークに登録してください!',
      'ru':
          'Чтобы не пропустить интересные маршруты, новые машины, ачивки, или горячие предложения подписывайтесь на соцсети twid!',
    },
    '2rovny6s': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Casa',
      'ja': '家',
      'ru': 'Дом',
    },
  },
  // CALENDAR
  {
    '5bul3epj': {
      'en':
          'Your journey will begin on October 10 at 11:00 in Cabo da Roca and will end on October 12 in Nazare.',
      'ar':
          'ستبدأ رحلتك في 10 أكتوبر في تمام الساعة 11:00 في كابو دا روكا وستنتهي في 12 أكتوبر في نازاري.',
      'es':
          'Su viaje comenzará el 10 de octubre a las 11:00 en Cabo da Roca y terminará el 12 de octubre en Nazare.',
      'ja': '旅は 10 月 10 日の 11:00 にロカ岬で始まり、10 月 12 日にナザレで終わります。',
      'ru':
          'Ваше путешествие начнется 10 октября в 11:00 в Кабо да Рока и закончится 12 октября в Назаре. ',
    },
    '15wx4hjx': {
      'en':
          'A double room has been booked for you at the Belmond Delux Hotel in Tratata. Check-in at the hotel on October 11 at 20:00, check-out on October 12 at 12:00. Breakfast is included in the accommodation.',
      'ar':
          'تم حجز غرفة مزدوجة لك في فندق Belmond Delux في تراتاتا. تسجيل الوصول في الفندق يوم 11 أكتوبر الساعة 20:00 ، تسجيل المغادرة في 12 أكتوبر الساعة 12:00. الإفطار مشمول في مكان الإقامة.',
      'es':
          'Se ha reservado una habitación doble para usted en el Hotel Belmond Delux en Tratata. Check-in en el hotel el 11 de octubre a las 20:00, check-out el 12 de octubre a las 12:00. El desayuno está incluido en el alojamiento.',
      'ja':
          'トラタタのベルモンド デラックス ホテルのダブルルームが予約されました。 10 月 11 日 20:00 にホテルにチェックインし、10 月 12 日 12:00 にチェックアウトします。朝食は宿泊料金に含まれています。',
      'ru':
          'Для вас забронирован двухместный номер в отеле Belmond Delux в городе Тратата. Заселение в отель 11 октября в 20:00, чекаут 12 октября в 12:00. В проживание включен завтрак.',
    },
    'ijy45luh': {
      'en': 'Set a reminder',
      'ar': 'ضبط تذكير',
      'es': 'Establecer un recordatorio',
      'ja': 'リマインダーを設定する',
      'ru': 'Установить напоминание',
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
      'ar': 'بيت',
      'es': 'Casa',
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
          'بورش 911 لديها محركان يعملان بالبنزين. وهي متوفرة بناقل حركة يدوي وأوتوماتيكي. 911 هي سيارة ذات 4 مقاعد و 6 سلندر ويبلغ طولها 4519 ملم وعرضها 1852 ملم وقاعدة عجلاتها 2450 ملم.',
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
      'en': 'Before starting the journey, the car is refueled to a full tank.',
      'ar': 'قبل بدء الرحلة ، يتم تزويد السيارة بالوقود في خزان ممتلئ.',
      'es':
          'Antes de iniciar el viaje, el coche se reposta con el depósito lleno.',
      'ja': '旅を始める前に、車は満タンに給油されます。',
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
      'ar': 'بيت',
      'es': 'Casa',
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
      'en': 'How to pick up the car?',
      'ar': 'كيف تلتقط السيارة؟',
      'es': '¿Cómo recoger el coche?',
      'ja': '車の受け取り方法は？',
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
      'en': 'How to return the car?',
      'ar': 'كيف تعيد السيارة؟',
      'es': '¿Cómo devolver el coche?',
      'ja': '車の返却方法は？',
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
      'ar': 'بيت',
      'es': 'Casa',
      'ja': '家',
      'ru': 'Дом',
    },
  },
  // Settings
  {
    '7plcb94k': {
      'en': 'SETTINGS',
      'ar': 'إعدادات',
      'es': 'AJUSTES',
      'ja': '設定',
      'ru': 'НАСТРОЙКИ',
    },
    '16gdwltg': {
      'en': 'CHOOSING THE APPLICATION LANGUAGE',
      'ar': 'اختيار لغة التطبيق',
      'es': 'ELEGIR EL IDIOMA DE LA APLICACIÓN',
      'ja': 'アプリケーション言語の選択',
      'ru': 'ВЫБОР ЯЗЫКА ПРИЛОЖЕНИЯ',
    },
    'jphtzjqj': {
      'en': 'English',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
    'o48rvdhx': {
      'en': 'Русский',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
    'z2mta198': {
      'en': 'Español',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
    'nkbmevc7': {
      'en': '日本語',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
    '3xbphq3b': {
      'en': 'عربي',
      'ar': '',
      'es': '',
      'ja': '',
      'ru': '',
    },
    'a5uwsc6g': {
      'en': 'SOUND PROMPTS',
      'ar': 'المروج الصوتية',
      'es': 'INDICACIONES DE SONIDO',
      'ja': 'サウンドプロンプト',
      'ru': 'ЗВУКОВЫЕ ПОДСКАЗКИ',
    },
    '9qd8062v': {
      'en': 'Turn on',
      'ar': 'شغله',
      'es': 'Encender',
      'ja': 'オンにする',
      'ru': 'Включить',
    },
    'o6t7q7lo': {
      'en': 'Turn off',
      'ar': 'يطفىء',
      'es': 'Apagar',
      'ja': '消す',
      'ru': 'Выключить',
    },
    'e274okr1': {
      'en': 'NAVIGATOR VIEW',
      'ar': 'عرض الملاح',
      'es': 'VISTA DEL NAVEGADOR',
      'ja': 'ナビゲータービュー',
      'ru': 'ВИД НАВИГАТОРА',
    },
    '4eezqmjj': {
      'en': 'Light',
      'ar': 'ضوء',
      'es': 'Luz',
      'ja': '光',
      'ru': 'Светлый',
    },
    'm1dh6uwm': {
      'en': 'Dark',
      'ar': 'داكن',
      'es': 'Oscuro',
      'ja': '暗い',
      'ru': 'Темный',
    },
    's7zcsmgi': {
      'en': 'EMERGENCY CALL',
      'ar': 'مكالمة طارئة',
      'es': 'LLAMADA DE EMERGENCIA',
      'ja': '緊急通話',
      'ru': 'ЭКСТРЕННЫЙ ВЫЗОВ',
    },
  },
  // Help
  {
    'n8v2kdkb': {
      'en': 'HELP',
      'ar': 'يساعد',
      'es': 'AYUDAR',
      'ja': 'ヘルプ',
      'ru': 'ПОМОЩЬ',
    },
    'xyqcahji': {
      'en': 'HOW TO USE THE APP',
      'ar': 'كيفية استخدام التطبيق',
      'es': 'CÓMO USAR LA APLICACIÓN',
      'ja': 'アプリの使用方法',
      'ru': 'КАК ПОЛЬЗОВАТЬСЯ ПРИЛОЖЕНИЕМ',
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
      'en': 'INFORMATION ABOUT THE NAVIGATOR',
      'ar': 'معلومات عن الملاح',
      'es': 'INFORMACIÓN SOBRE EL NAVEGADOR',
      'ja': 'ナビゲーターについて',
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
      'en': 'HOW TO PICK UP A CAR',
      'ar': 'كيف تستلم سيارة',
      'es': 'CÓMO RECOGER UN COCHE',
      'ja': '車の受け取り方法',
      'ru': 'КАК ЗАБИРАТЬ АВТОМОБИЛЬ',
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
      'en': 'HOW TO RETURN THE CAR',
      'ar': 'كيفية إعادة السيارة',
      'es': 'CÓMO DEVOLVER EL COCHE',
      'ja': '返却方法',
      'ru': 'КАК ВЕРНУТЬ АВТОМОБИЛЬ',
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
      'en': 'RULES FOR USING THE CAR',
      'ar': 'قواعد استخدام السيارة',
      'es': 'NORMAS PARA UTILIZAR EL COCHE',
      'ja': '車の使用規則',
      'ru': 'ПРАВИЛА ПОЛЬЗОВАНИЯ АВТОМОБИЛЕМ',
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
      'en': 'RULES FOR THE USE OF ARMOR IN THE HOTEL',
      'ar': 'قواعد استخدام الدروع في الفندق',
      'es': 'NORMAS PARA EL USO DE ARMADURAS EN EL HOTEL',
      'ja': 'ホテルでの鎧の使用に関する規則',
      'ru': 'ПРАВИЛА ИСПОЛЬЗОВАНИЯ БРОНИ В ОТЕЛЕ',
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
      'en': 'LIABILITY INSURANCE',
      'ar': 'تأمين المسؤولية',
      'es': 'SEGURO DE RESPONSABILIDAD',
      'ja': '損害賠償保険',
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
      'en': 'Ask a question',
      'ar': 'طرح سؤال',
      'es': 'Hacer una pregunta',
      'ja': '質問する',
      'ru': 'Задайте вопрос',
    },
    '97l7zg5g': {
      'en': 'Your name',
      'ar': 'اسمك',
      'es': 'Tu nombre',
      'ja': 'あなたの名前',
      'ru': 'Ваше имя',
    },
    'rak6fjv6': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'es': 'Correo electrónico',
      'ja': 'Eメール',
      'ru': 'Электронное письмо',
    },
    'u9oeq7w1': {
      'en': 'Start writing',
      'ar': 'ابدأ الكتابة',
      'es': 'Empieza a escribir',
      'ja': '書き始める',
      'ru': 'Начать писать',
    },
    'wxepaaij': {
      'en': 'SEND',
      'ar': 'يرسل',
      'es': 'ENVIAR',
      'ja': '送信',
      'ru': 'ОТПРАВИТЬ',
    },
    '1hd7ebwe': {
      'en': 'We will send the answer to your question by e-mail',
      'ar': 'سوف نرسل إجابة سؤالك عن طريق البريد الإلكتروني',
      'es': 'Le enviaremos la respuesta a su pregunta por correo electrónico.',
      'ja': 'ご質問の回答をメールでお送りします',
      'ru': 'Мы отправим ответ на ваш вопрос по электронной почте',
    },
    'wsofpb41': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Casa',
      'ja': '家',
      'ru': 'Дом',
    },
  },
  // SUPPORT
  {
    'vqz0mtym': {
      'en': 'SUPPORT SERVICE',
      'ar': 'خدمة الدعم',
      'es': 'SERVICIO DE SOPORTE',
      'ja': 'サポートサービス',
      'ru': 'СЛУЖБА ПОДДЕРЖКИ',
    },
    'l0ff1ngm': {
      'en': 'THANKS!',
      'ar': 'شكرًا',
      'es': 'GRACIAS',
      'ja': 'ありがとう',
      'ru': 'СПАСИБО!',
    },
    'f25pvfm9': {
      'en':
          'Valery, hello! Thank you for contacting the support service. We will try to answer your question as soon as possible and send you an answer by email.',
      'ar':
          'فاليري ، مرحبا! شكرا على اتصالك بخدمة الدعم. سنحاول الإجابة على سؤالك في أقرب وقت ممكن ونرسل لك إجابة عبر البريد الإلكتروني.',
      'es':
          'Valery, hola! Gracias por ponerse en contacto con el servicio de soporte. Intentaremos responder a su pregunta lo antes posible y enviarle una respuesta por correo electrónico.',
      'ja':
          'ヴァレリー、こんにちは！サポートサービスにお問い合わせいただきありがとうございます。できるだけ早くご質問にお答えし、メールで回答をお送りします。',
      'ru':
          'Валерий, привет! Спасибо за обращение в службу поддержки. Мы постараемся как можно скорее ответить на ваш вопрос и отправить вам ответ по электронной почте.',
    },
    'ddyicczm': {
      'en': 'OK',
      'ar': 'OK',
      'es': 'OK',
      'ja': 'OK',
      'ru': 'OK',
    },
    'ujxr0zqq': {
      'en': 'Home',
      'ar': 'بيت',
      'es': 'Casa',
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
