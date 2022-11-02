import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ru', 'en', 'es', 'ko', 'ar'];

  String get languageCode => locale.toString();
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ruText = '',
    String? enText = '',
    String? esText = '',
    String? koText = '',
    String? arText = '',
  }) =>
      [ruText, enText, esText, koText, arText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      FFLocalizations.languages().contains(locale.toString());

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
      'ru': 'Please choose a \nlanguage',
      'ar': 'Please choose a language',
      'en': 'Please choose a language',
      'es': 'Please choose a language',
      'ko': 'Please choose a language',
    },
    '8swe181o': {
      'ru': 'ENGLISH',
      'ar': 'ENGLISH',
      'en': 'ENGLISH',
      'es': 'ENGLISH',
      'ko': 'ENGLISH',
    },
    '6n6ffivf': {
      'ru': 'РУССКИЙ',
      'ar': 'РУССКИЙ',
      'en': 'РУССКИЙ',
      'es': 'РУССКИЙ',
      'ko': 'РУССКИЙ',
    },
    '9jgt0kph': {
      'ru': 'ESPAÑOL',
      'ar': 'ESPAÑOL',
      'en': 'ESPAÑOL',
      'es': 'ESPAÑOL',
      'ko': 'ESPAÑOL',
    },
    'jguowibg': {
      'ru': '日本',
      'ar': '日本',
      'en': '日本',
      'es': '日本',
      'ko': '日本',
    },
    'x0c3a2zl': {
      'ru': 'عربى',
      'ar': 'عربى',
      'en': 'عربى',
      'es': 'عربى',
      'ko': 'عربى',
    },
    'bmetd3l7': {
      'ru': 'OK',
      'ar': 'OK',
      'en': 'OK',
      'es': 'OK',
      'ko': 'OK',
    },
    'jczuhabi': {
      'ru': '',
      'ar': '',
      'en': '',
      'es': '',
      'ko': '',
    },
  },
  // HomePage
  {
    'qx8u6kmq': {
      'ru': 'Введите номер бронирования ',
      'ar': 'أدخل رقم الحجز الخاص بك',
      'en': 'Enter your booking number',
      'es': 'Introduce tu número de reserva',
      'ko': '예약 번호를 입력하세요',
    },
    'ypfz29i7': {
      'ru': 'OK',
      'ar': 'نعم',
      'en': 'OK',
      'es': 'OK',
      'ko': '확인',
    },
    '2eqpkck1': {
      'ru':
          'Если вы еще не выбрали маршрут для \nпутешествия перейдите на сайт',
      'ar': 'إذا لم تكن قد اخترت طريقًا للسفر بعد ، فانتقل إلى الموقع',
      'en': 'If you have not yet chosen a route for travel, go to the site',
      'es': 'Si aún no ha elegido una ruta para viajar, vaya al sitio',
      'ko': '아직 여행 경로를 선택하지 않았다면 사이트로 이동',
    },
    'b0eqhtut': {
      'ru': 'Как использовать приложение?',
      'ar': 'كيف تستخدم التطبيق؟',
      'en': 'How to use the application?',
      'es': '¿Cómo usar la aplicación?',
      'ko': '응용 프로그램을 사용하는 방법?',
    },
    'wf7mh0gc': {
      'ru': 'Home',
      'ar': 'مسكن',
      'en': 'Home',
      'es': 'Hogar',
      'ko': '집',
    },
  },
  // Trip1
  {
    '7b7tfv87': {
      'ru': 'Ваше путешествие начнется через:',
      'ar': 'ستبدأ رحلتك في:',
      'en': 'Your journey will start in:',
      'es': 'Su viaje comenzará en:',
      'ko': '여정은 다음에서 시작됩니다.',
    },
    'wzbafwa9': {
      'ru': '10 октября — 12 октября, 2022',
      'ar': '10 أكتوبر - 12 أكتوبر 2022',
      'en': 'October 10 — October 12, 2022',
      'es': '10 de octubre — 12 de octubre de 2022',
      'ko': '2022년 10월 10일 — 10월 12일',
    },
    'hy6dw4ym': {
      'ru': 'Porsche 911 Carrera GTS',
      'ar': 'بورش 911 كاريرا جي تي إس',
      'en': 'Porsche 911 Carrera GTS',
      'es': 'Porsche 911 Carrera GTS',
      'ko': '포르쉐 911 카레라 GTS',
    },
    'okjp83oo': {
      'ru': 'Cabo da Roca — Nazare. Portugal',
      'ar': 'كابو دا روكا - نازاري. البرتغال',
      'en': 'Cabo da Roca - Nazare. Portugal',
      'es': 'Cabo da Roca - Nazaré. Portugal',
      'ko': '카보 다 로카 - 나자레. 포르투갈',
    },
    'fll91hyi': {
      'ru': 'More journey details',
      'ar': 'مزيد من تفاصيل الرحلة',
      'en': 'More journey details',
      'es': 'Más detalles del viaje',
      'ko': '더 많은 여행 정보',
    },
    'ocefep6i': {
      'ru': 'Как забрать машину?',
      'ar': 'كيف تلتقط سيارة؟',
      'en': 'How to pick up a car?',
      'es': '¿Cómo recoger un coche?',
      'ko': '차를 픽업하는 방법?',
    },
    '44rr2ku7': {
      'ru': 'Home',
      'ar': 'مسكن',
      'en': 'Home',
      'es': 'Hogar',
      'ko': '집',
    },
  },
  // Instructions010
  {
    'igmpnhzd': {
      'ru': 'Пожалуйста, ознакомьтесь с правилами',
      'ar': 'يرجى قراءة القواعد',
      'en': 'Please read the rules',
      'es': 'Por favor lea las reglas',
      'ko': '규칙을 읽어주세요',
    },
    '5paztg0h': {
      'ru': 'ПРАВИЛА ИСПОЛЬЗОВАНИЯ АВТОМОБИЛЯ',
      'ar': 'قواعد استخدام السيارة',
      'en': 'RULES FOR USE OF THE CAR',
      'es': 'NORMAS PARA EL USO DEL COCHE',
      'ko': '자동차 사용 규칙',
    },
    'ymjci8j5': {
      'ru':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ar':
          '1. Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'en':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'es':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ko':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
    },
    'iu1sb52u': {
      'ru': 'ПРАВИЛА СТРАХОВАНИЯ',
      'ar': 'قواعد التأمين',
      'en': 'INSURANCE RULES',
      'es': 'REGLAS DE SEGURO',
      'ko': '보험 규정',
    },
    'nva1bsz7': {
      'ru':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ar':
          '1. Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'en':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'es':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ko':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
    },
    'e19nqw8s': {
      'ru': 'ПРАВИЛА ПОЛЬЗОВАНИЯ БРОНЬЮ ГОСТИНИЦЫ',
      'ar': 'شروط وأحكام حجز الفنادق',
      'en': 'HOTEL BOOKING TERMS AND CONDITIONS',
      'es': 'TÉRMINOS Y CONDICIONES DE RESERVA DE HOTELES',
      'ko': '호텔 예약 약관',
    },
    'ajpti0h9': {
      'ru':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ar':
          '1. Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'en':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'es':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ko':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
    },
    'g6degmim': {
      'ru': 'ПРАВИЛА БЕЗОПАСНОСТИ',
      'ar': 'لوائح السلامة',
      'en': 'SAFETY REGULATIONS',
      'es': 'REGULACIONES DE SEGURIDAD',
      'ko': '안전 규정',
    },
    '3s63quou': {
      'ru':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ar':
          '1. Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'en':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'es':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ko':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
    },
    '3e6mr48m': {
      'ru': 'ЭКСТРЕННАЯ СВЯЗЬ',
      'ar': 'حالة طوارئ',
      'en': 'EMERGENCY',
      'es': 'EMERGENCIA',
      'ko': '비상',
    },
    '58ws4c12': {
      'ru':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ar':
          '1. Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'en':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'es':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ko':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
    },
    'rjiw6puk': {
      'ru': 'ПРОЧИТАЛ. СОГЛАСЕН',
      'ar': 'قرأ. أنا موافق',
      'en': 'READ. I AGREE',
      'es': 'LEER. ESTOY DE ACUERDO',
      'ko': '읽다. 동의한다',
    },
    '8ckyk7t6': {
      'ru': 'Home',
      'ar': 'مسكن',
      'en': 'Home',
      'es': 'Hogar',
      'ko': '집',
    },
  },
  // Trip2
  {
    'pz4ro1we': {
      'ru':
          'Кнопки на экране навигатора помогут вам ориентироваться на протяжении всего маршрута. Вы легко можете перейти от одной точки назначения до другой или вернуться назад.  ',
      'ar':
          'ستساعدك الأزرار الموجودة على شاشة الملاح على التنقل عبر المسار. يمكنك بسهولة الانتقال من وجهة إلى أخرى أو العودة.',
      'en':
          'The buttons on the navigator screen will help you navigate throughout the route. You can easily go from one destination to another or go back.',
      'es':
          'Los botones de la pantalla del navegador te ayudarán a navegar por la ruta. Puede ir fácilmente de un destino a otro o regresar.',
      'ko':
          '네비게이터 화면의 버튼은 경로 전체를 탐색하는 데 도움이 됩니다. 한 목적지에서 다른 목적지로 쉽게 이동하거나 돌아갈 수 있습니다.',
    },
    'vin93ofb': {
      'ru': 'ОК. ДАЛЬШЕ',
      'ar': 'نعم. أبعد',
      'en': 'OK. FARTHER',
      'es': 'ESTÁ BIEN. MÁS LEJOS',
      'ko': '확인. 더 멀리',
    },
    'kuswjwgq': {
      'ru':
          'По достижении новой точки навигатор подскажет о наличии интересной информации, которую мы для вас тщательно подобрали. Кликните Point Information. ',
      'ar':
          'عند الوصول إلى نقطة جديدة ، سيخبرك الملاح بوجود معلومات مثيرة للاهتمام اخترناها لك بعناية. انقر فوق معلومات النقطة.',
      'en':
          'Upon reaching a new point, the navigator will tell you about the presence of interesting information that we have carefully selected for you. Click Point Information.',
      'es':
          'Al llegar a un nuevo punto, el navegador le informará sobre la presencia de información interesante que hemos seleccionado cuidadosamente para usted. Haga clic en Información del punto.',
      'ko':
          '새로운 지점에 도달하면 네비게이터는 귀하를 위해 신중하게 선택한 흥미로운 정보의 존재에 대해 알려줄 것입니다. 포인트 정보를 클릭합니다.',
    },
    'ncaulhea': {
      'ru': 'ОК. ДАЛЬШЕ',
      'ar': 'نعم. أبعد',
      'en': 'OK. FARTHER',
      'es': 'ESTÁ BIEN. MÁS LEJOS',
      'ko': '확인. 더 멀리',
    },
    'c3bdx0kk': {
      'ru':
          'Кнопки на экране навигатора помогут вам ориентироваться на протяжении всего маршрута. Вы легко можете перейти от одной точки назначения до другой или вернуться назад.  ',
      'ar':
          'ستساعدك الأزرار الموجودة على شاشة الملاح على التنقل عبر المسار. يمكنك بسهولة الانتقال من وجهة إلى أخرى أو العودة.',
      'en':
          'The buttons on the navigator screen will help you navigate throughout the route. You can easily go from one destination to another or go back.',
      'es':
          'Los botones de la pantalla del navegador te ayudarán a navegar por la ruta. Puede ir fácilmente de un destino a otro o regresar.',
      'ko':
          '네비게이터 화면의 버튼은 경로 전체를 탐색하는 데 도움이 됩니다. 한 목적지에서 다른 목적지로 쉽게 이동하거나 돌아갈 수 있습니다.',
    },
    'ioa7i7qj': {
      'ru': 'ОК. ДАЛЬШЕ',
      'ar': 'نعم. أبعد',
      'en': 'OK. FARTHER',
      'es': 'ESTÁ BIEN. MÁS LEJOS',
      'ko': '확인. 더 멀리',
    },
    'lyh3zlw8': {
      'ru': 'Home',
      'ar': 'مسكن',
      'en': 'Home',
      'es': 'Hogar',
      'ko': '집',
    },
  },
  // TripStart
  {
    '3c87wq81': {
      'ru': 'НАЧАТЬ ПУТЕШЕСТВИЕ',
      'ar': 'بداية رحلة',
      'en': 'START A JOURNEY',
      'es': 'COMENZAR UN VIAJE',
      'ko': '여행을 시작하세요',
    },
    'adl2jnc3': {
      'ru': 'Как забрать машину',
      'ar': 'كيف تلتقط سيارة',
      'en': 'How to pick up a car',
      'es': 'Cómo recoger un coche',
      'ko': '차를 픽업하는 방법',
    },
    '6r478cgk': {
      'ru': 'Home',
      'ar': 'مسكن',
      'en': 'Home',
      'es': 'Hogar',
      'ko': '집',
    },
  },
  // MainNavigatorPage
  {
    'gnh6m1of': {
      'ru': 'ПОЕХАЛИ!',
      'ar': 'يذهب!',
      'en': 'GO!',
      'es': '¡VAMOS!',
      'ko': '가다!',
    },
    'kfr798l2': {
      'ru': 'ИНФОРМАЦИЯ О МЕСТЕ',
      'ar': 'معلومات الموقع',
      'en': 'LOCATION INFORMATION',
      'es': 'INFORMACIÓN SOBRE LA UBICACIÓN',
      'ko': '위치 정보',
    },
    'qp05f9qx': {
      'ru': 'Home',
      'ar': 'مسكن',
      'en': 'Home',
      'es': 'Hogar',
      'ko': '집',
    },
  },
  // PlaceInformation
  {
    '4wv1lfde': {
      'ru': 'STARTING POINT',
      'ar': 'نقطة البداية',
      'en': 'STARTING POINT',
      'es': 'PUNTO DE PARTIDA',
      'ko': '출발점',
    },
    '7rhxdpfg': {
      'ru': 'CASCAIS',
      'ar': 'كاسكا',
      'en': 'CASCAIS',
      'es': 'CASCAIS',
      'ko': '카스카이스',
    },
    'xg8a54gn': {
      'ru': 'PORTUGAL',
      'ar': 'البرتغال',
      'en': 'PORTUGAL',
      'es': 'PORTUGAL',
      'ko': '포르투갈',
    },
    'zkpybfkk': {
      'ru': 'LIGHTHOUSE',
      'ar': 'منارة',
      'en': 'LIGHTHOUSE',
      'es': 'FARO',
      'ko': '등대',
    },
    'bjc02soe': {
      'ru':
          'Libero et saepe ipsa cum. Recusandae aut nostrum odit rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Esse officiis inventore voluptates inventore adipisci itaque nostrum. Repudiandae ea et modi veniam.',
      'ar':
          'Libero et saepe ipsa cum. Recusandae aut nostrum odit rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores سايب طارد. Esse officiis يخترع voluptates يخترع adipisci itaque nostrum. Repudiandae ea et modi veniam.',
      'en':
          'Libero et saepe ipsa cum. Recusandae aut nostrum odit rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Esse officiis inventore voluptates inventore adipisci itaque nostrum. Repudiandae ea et modi veniam.',
      'es':
          'Líbero et saepe ipsa cum. Recusandae aut nostrum odit rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Esse officiis inventore voluptates inventore adipisci itaque nostrum. Repudiandae ea et modi veniam.',
      'ko':
          'Libero et saepe ipsa cum. Recusandae aut nostrum odit rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Esse officiis Inventore는 Inventore adipisci itaque nostrum을 휘젓습니다. Repudiandae ea et modi veniam.',
    },
    '2apx1aol': {
      'ru': 'Listen audio',
      'ar': 'استمع الصوت',
      'en': 'listen audio',
      'es': 'escuchar audio',
      'ko': '오디오를 듣다',
    },
    '0gd3jgil': {
      'ru': 'SEASHORE',
      'ar': 'شاطئ البحر',
      'en': 'SEASHORE',
      'es': 'COSTA',
      'ko': '해변',
    },
    'xopfntch': {
      'ru':
          'Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Aut deserunt a laborum asperiores quia in sint eos. Nemo dolores ut aut et natus voluptatem quaerat. Esse officiis inventore voluptates inventore adipisci itaque nostrum. ',
      'ar':
          'Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores سايب طارد. أو تجنب العمل البدني في sint eos. نيمو تلعب مع الطبيعة والحياة الطبيعية. Esse officiis يخترع voluptates يخترع adipisci itaque nostrum.',
      'en':
          'Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Aut deserunt a laborum asperiores quia in sint eos. Nemo dolores ut aut et natus voluptatem quaerat. Esse officiis inventore voluptates inventore adipisci itaque nostrum.',
      'es':
          'Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Aut deserunt a laborum asperiores quia in sint eos. Nemo dolores ut aut et natus voluptatem quaerat. Esse officiis inventore voluptates inventore adipisci itaque nostrum.',
      'ko':
          'Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Aut deserunt a labourum asperiores quia in sint eos. Nemo dolores ut aut et natus voluptatem quaerat. Esse officiis Inventore는 Inventore adipisci itaque nostrum을 휘젓습니다.',
    },
    'gwcp83bs': {
      'ru': 'Listen audio',
      'ar': 'استمع الصوت',
      'en': 'listen audio',
      'es': 'escuchar audio',
      'ko': '오디오를 듣다',
    },
    'quefzvnq': {
      'ru': 'BACK TO NAVIGATOR',
      'ar': 'العودة إلى الملاح',
      'en': 'BACK TO NAVIGATOR',
      'es': 'VOLVER AL NAVEGADOR',
      'ko': '탐색기로 돌아가기',
    },
    'zumghl25': {
      'ru': 'Home',
      'ar': 'مسكن',
      'en': 'Home',
      'es': 'Hogar',
      'ko': '집',
    },
  },
  // PlaceInformationPoint
  {
    '2uxvi0iv': {
      'ru': 'POINT 2 (OF 6)',
      'ar': 'النقطة 2 (من 6)',
      'en': 'POINT 2 (OF 6)',
      'es': 'PUNTO 2 (DE 6)',
      'ko': 'POINT 2(6개 중)',
    },
    'r20f6faw': {
      'ru': 'NEW POINT',
      'ar': 'نقطة جديدة',
      'en': 'NEW POINT',
      'es': 'PUNTO NUEVO',
      'ko': '새로운 포인트',
    },
    'yn1gzi9t': {
      'ru': 'PORTUGAL',
      'ar': 'البرتغال',
      'en': 'PORTUGAL',
      'es': 'PORTUGAL',
      'ko': '포르투갈',
    },
    'njcgxhas': {
      'ru': 'OLD CASTLE',
      'ar': 'القلعة القديمة',
      'en': 'OLD CASTLE',
      'es': 'CASTILLO VIEJO',
      'ko': '옛 성',
    },
    'eq6bg4hv': {
      'ru':
          'Libero et saepe ipsa cum. Recusandae aut nostrum odit rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Esse officiis inventore voluptates inventore adipisci itaque nostrum. Repudiandae ea et modi veniam.',
      'ar':
          'Libero et saepe ipsa cum. Recusandae aut nostrum odit rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores سايب طارد. Esse officiis يخترع voluptates يخترع adipisci itaque nostrum. Repudiandae ea et modi veniam.',
      'en':
          'Libero et saepe ipsa cum. Recusandae aut nostrum odit rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Esse officiis inventore voluptates inventore adipisci itaque nostrum. Repudiandae ea et modi veniam.',
      'es':
          'Líbero et saepe ipsa cum. Recusandae aut nostrum odit rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Esse officiis inventore voluptates inventore adipisci itaque nostrum. Repudiandae ea et modi veniam.',
      'ko':
          'Libero et saepe ipsa cum. Recusandae aut nostrum odit rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Esse officiis Inventore는 Inventore adipisci itaque nostrum을 휘젓습니다. Repudiandae ea et modi veniam.',
    },
    'mt3k8scy': {
      'ru': 'Listen audio',
      'ar': 'استمع الصوت',
      'en': 'listen audio',
      'es': 'escuchar audio',
      'ko': '오디오를 듣다',
    },
    'fx5ab5ue': {
      'ru': 'OCEANARIUM',
      'ar': 'المحيط',
      'en': 'OCEANARIUM',
      'es': 'OCEANARIO',
      'ko': '해양 수족관',
    },
    'kgw33dh9': {
      'ru':
          'Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Aut deserunt a laborum asperiores quia in sint eos. Nemo dolores ut aut et natus voluptatem quaerat. Esse officiis inventore voluptates inventore adipisci itaque nostrum. ',
      'ar':
          'Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores سايب طارد. أو تجنب العمل البدني في sint eos. نيمو تلعب مع الطبيعة والحياة الطبيعية. Esse officiis يخترع voluptates يخترع adipisci itaque nostrum.',
      'en':
          'Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Aut deserunt a laborum asperiores quia in sint eos. Nemo dolores ut aut et natus voluptatem quaerat. Esse officiis inventore voluptates inventore adipisci itaque nostrum.',
      'es':
          'Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Aut deserunt a laborum asperiores quia in sint eos. Nemo dolores ut aut et natus voluptatem quaerat. Esse officiis inventore voluptates inventore adipisci itaque nostrum.',
      'ko':
          'Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Aut deserunt a labourum asperiores quia in sint eos. Nemo dolores ut aut et natus voluptatem quaerat. Esse officiis Inventore는 Inventore adipisci itaque nostrum을 휘젓습니다.',
    },
    'dqpkzpnq': {
      'ru': 'Listen audio',
      'ar': 'استمع الصوت',
      'en': 'listen audio',
      'es': 'escuchar audio',
      'ko': '오디오를 듣다',
    },
    'ewex2sak': {
      'ru': 'BACK TO NAVIGATOR',
      'ar': 'العودة إلى الملاح',
      'en': 'BACK TO NAVIGATOR',
      'es': 'VOLVER AL NAVEGADOR',
      'ko': '탐색기로 돌아가기',
    },
    'pycuatrj': {
      'ru': 'Home',
      'ar': 'مسكن',
      'en': 'Home',
      'es': 'Hogar',
      'ko': '집',
    },
  },
  // MainNavigatorPage2
  {
    'bf5ij9cc': {
      'ru': 'POINT INFORMATION',
      'ar': 'معلومات النقطة',
      'en': 'POINT INFORMATION',
      'es': 'INFORMACIÓN DEL PUNTO',
      'ko': '포인트 정보',
    },
    'p1w1h31l': {
      'ru': 'Home',
      'ar': 'مسكن',
      'en': 'Home',
      'es': 'Hogar',
      'ko': '집',
    },
  },
  // MainNavigatorPagePlaceInfo
  {
    'pbolbx7o': {
      'ru': 'POINT INFORMATION',
      'ar': 'معلومات النقطة',
      'en': 'POINT INFORMATION',
      'es': 'INFORMACIÓN DEL PUNTO',
      'ko': '포인트 정보',
    },
    'o1d3a07q': {
      'ru': 'Home',
      'ar': 'مسكن',
      'en': 'Home',
      'es': 'Hogar',
      'ko': '집',
    },
  },
  // MainNavigatorPageFinish
  {
    'lm18fn7u': {
      'ru': 'ФИНИШ',
      'ar': 'إنهاء',
      'en': 'FINISH',
      'es': 'FINALIZAR',
      'ko': '마치다',
    },
    'kiuoxc9a': {
      'ru': 'ИНФОРМАЦИЯ О МЕСТЕ',
      'ar': 'معلومات الموقع',
      'en': 'LOCATION INFORMATION',
      'es': 'INFORMACIÓN SOBRE LA UBICACIÓN',
      'ko': '위치 정보',
    },
    '5arc7cyt': {
      'ru': 'Home',
      'ar': 'مسكن',
      'en': 'Home',
      'es': 'Hogar',
      'ko': '집',
    },
  },
  // TripFinish2
  {
    'n2heetyi': {
      'ru': 'НАЧАТЬ НОВОЕ \nПУТЕШЕСТВИЕ',
      'ar': 'ابدأ رحلة جديدة',
      'en': 'START A NEW JOURNEY',
      'es': 'EMPIEZA UN NUEVO VIAJE',
      'ko': '새로운 여정을 시작하세요',
    },
    'f56kaj7j': {
      'ru':
          'Чтобы не пропустить интересные маршруты, новые машины, ачивки, или горячие предложения подписывайтесь на соцсети twid!',
      'ar':
          'حتى لا تفوت الطرق المثيرة للاهتمام أو السيارات الجديدة أو الإنجازات أو العروض الساخنة ، اشترك في شبكات التواصل الاجتماعي twid!',
      'en':
          'In order not to miss interesting routes, new cars, achievements, or hot offers, subscribe to twid social networks!',
      'es':
          '¡Para no perderse rutas interesantes, autos nuevos, logros u ofertas interesantes, suscríbase a las redes sociales twid!',
      'ko': '흥미로운 경로, 새 자동차, 업적 또는 인기 상품을 놓치지 않으려면 twid 소셜 네트워크에 가입하세요!',
    },
    '2rovny6s': {
      'ru': 'Home',
      'ar': 'مسكن',
      'en': 'Home',
      'es': 'Hogar',
      'ko': '집',
    },
  },
  // TripFinish
  {
    '60w182x5': {
      'ru':
          'Ваше путешествие окончено.  Надеемся оно прошло прекрасно и вам понравился выбранный маршрут.',
      'ar':
          'رحلتك انتهت. نأمل أن تسير الأمور على ما يرام وأعجبك الطريق الذي اخترته.',
      'en':
          'Your journey is over. We hope it went well and you liked the chosen route.',
      'es':
          'Tu viaje ha terminado. Esperamos que te haya ido bien y te haya gustado la ruta elegida.',
      'ko': '당신의 여행은 끝났습니다. 잘 진행되어 선택한 경로가 마음에 드셨기를 바랍니다.',
    },
    'c1gc858g': {
      'ru':
          'Если у вас есть какие-то пожелания или замечания, будем рады, если вы напишите нам на почту contact@twid.com',
      'ar':
          'إذا كان لديك أي رغبات أو تعليقات ، سنكون سعداء إذا راسلتنا على contact@twid.com',
      'en':
          'If you have any wishes or comments, we will be glad if you write to us at contact@twid.com',
      'es':
          'Si tiene algún deseo o comentario, nos complacerá que nos escriba a contact@twid.com',
      'ko': '바라는 점이나 의견이 있으시면 contact@twid.com으로 편지를 보내주시면 기쁠 것입니다.',
    },
    'enga795w': {
      'ru': 'НАЧАТЬ ПУТЕШЕСТВИЕ',
      'ar': 'بداية رحلة',
      'en': 'START A JOURNEY',
      'es': 'COMENZAR UN VIAJE',
      'ko': '여행을 시작하세요',
    },
    'tjf8529p': {
      'ru': 'Вы проехали 3260 км. ',
      'ar': 'لقد سافرت 3260 كم.',
      'en': 'You have traveled 3260 km.',
      'es': 'Has recorrido 3260 km.',
      'ko': '3260km를 이동했습니다.',
    },
    'mu0hqk53': {
      'ru': 'Получена ачивка «Путешественник»',
      'ar': 'تلقى الإنجاز &quot;المسافر&quot;',
      'en': 'Achievement &quot;Traveler&quot; received',
      'es': 'Logro &quot;Viajero&quot; recibido',
      'ko': '&quot;여행자&quot; 업적 획득',
    },
    'b6np5bk2': {
      'ru': 'Доступны новые маршруты',
      'ar': 'طرق جديدة متاحة',
      'en': 'New routes available',
      'es': 'Nuevas rutas disponibles',
      'ko': '새로운 경로 사용 가능',
    },
    '461vgj7g': {
      'ru': 'Прокод на скидку 15% — twidrive',
      'ar': 'Procode بخصم 15٪ - twidrive',
      'en': 'Procode for 15% discount - twidrive',
      'es': 'Procode para 15% de descuento - twidrive',
      'ko': 'Procode 15% 할인 - twidrive',
    },
    'xklsqefy': {
      'ru': 'Как забрать машину',
      'ar': 'كيف تلتقط سيارة',
      'en': 'How to pick up a car',
      'es': 'Cómo recoger un coche',
      'ko': '차를 픽업하는 방법',
    },
    'it29tisu': {
      'ru': 'ВЕРНУТЬСЯ К МАРШРУТУ',
      'ar': 'العودة إلى الطريق',
      'en': 'BACK TO ROUTE',
      'es': 'VOLVER A LA RUTA',
      'ko': '경로로 돌아가기',
    },
    'sp0ifsrs': {
      'ru': 'Home',
      'ar': 'مسكن',
      'en': 'Home',
      'es': 'Hogar',
      'ko': '집',
    },
  },
  // CALENDAR
  {
    '5bul3epj': {
      'ru':
          'Ваше путешествие начнется 10 октября в 11:00 в Кабо да Рока и закончится 12 октября в Назаре. ',
      'ar':
          'ستبدأ رحلتك في 10 أكتوبر الساعة 11:00 في Cabo da Roca وتنتهي في 12 أكتوبر في Nazare.',
      'en':
          'Your journey will start on October 10 at 11:00 in Cabo da Roca and end on October 12 in Nazare.',
      'es':
          'Tu viaje comenzará el 10 de octubre a las 11:00 en Cabo da Roca y terminará el 12 de octubre en Nazare.',
      'ko': '여행은 10월 10일 11:00에 Cabo da Roca에서 시작하여 10월 12일 Nazare에서 끝납니다.',
    },
    '15wx4hjx': {
      'ru':
          'Для вас забронирован двухместный номер в отеле Belmond Delux в городе Тратата. Заселение в отель 11 октября в 20:00, чекаут 12 октября в 12:00. В проживание включен завтрак.',
      'ar':
          'تم حجز غرفة مزدوجة من أجلك في فندق Belmond Delux في تراتاتا. تسجيل الوصول في الفندق يوم 11 أكتوبر الساعة 20:00 ، تسجيل المغادرة في 12 أكتوبر الساعة 12:00. يشمل السكن وجبة الإفطار.',
      'en':
          'A double room has been booked for you at the Belmond Delux Hotel in Tratata. Check-in at the hotel on October 11 at 20:00, check-out on October 12 at 12:00. Accommodation includes breakfast.',
      'es':
          'Se ha reservado una habitación doble para usted en el Hotel Belmond Delux en Tratata. Check-in en el hotel el 11 de octubre a las 20:00, check-out el 12 de octubre a las 12:00. El alojamiento incluye desayuno.',
      'ko':
          'Tratata의 Belmond Delux Hotel에서 더블룸이 예약되었습니다. 10월 11일 호텔 체크인 20:00, 체크아웃 10월 12일 12:00 숙박에는 아침 식사가 포함됩니다.',
    },
    'ijy45luh': {
      'ru': 'Установить напоминание',
      'ar': 'تعيين تذكير',
      'en': 'Set Reminder',
      'es': 'Establecer recordatorio',
      'ko': '미리 알림 설정',
    },
    'aiihtg6z': {
      'ru': 'BACK',
      'ar': 'الى الخلف',
      'en': 'BACK',
      'es': 'ESPALDA',
      'ko': '뒤',
    },
    'jlw6qz3b': {
      'ru': 'Home',
      'ar': 'مسكن',
      'en': 'Home',
      'es': 'Hogar',
      'ko': '집',
    },
  },
  // CAR
  {
    'se982brr': {
      'ru': 'PORSCHE',
      'ar': 'بورش',
      'en': 'PORSCHE',
      'es': 'PORSCHE',
      'ko': '포르쉐',
    },
    '4itqy889': {
      'ru': '911 CARRERA GTS',
      'ar': '911 CARRERA GTS',
      'en': '911 CARRERA GTS',
      'es': '911 CARRERA GTS',
      'ko': '911 카레라 GTS',
    },
    '73d3z6ux': {
      'ru':
          'The Porsche 911 has 2 Petrol Engine on offer. It is available with Manual & Automatic transmission. The 911 is a 4 seater 6 cylinder car and has length of 4519 mm, width of 1852 mm and a wheelbase of 2450 mm.',
      'ar':
          'بورش 911 لديها محركان يعملان بالبنزين. وهي متوفرة بناقل حركة يدوي وأوتوماتيكي. 911 هي سيارة ذات 4 مقاعد و 6 سلندر ويبلغ طولها 4519 ملم وعرضها 1852 ملم وقاعدة عجلاتها 2450 ملم.',
      'en':
          'The Porsche 911 has 2 Petrol Engines on offer. It is available with Manual &amp; Automatic transmission. The 911 is a 4 seater 6 cylinder car and has a length of 4519 mm, width of 1852 mm and a wheelbase of 2450 mm.',
      'es':
          'El Porsche 911 tiene 2 motores de gasolina en oferta. Está disponible con transmisión manual y automática. El 911 es un automóvil de 4 plazas y 6 cilindros y tiene una longitud de 4519 mm, una anchura de 1852 mm y una distancia entre ejes de 2450 mm.',
      'ko':
          'Porsche 911에는 2개의 가솔린 엔진이 있습니다. 수동 및 자동 변속기와 함께 사용할 수 있습니다. 911은 4인승 6기통 자동차로 길이 4519mm, 너비 1852mm, 휠베이스 2450mm입니다.',
    },
    'ejghvpv0': {
      'ru': 'Fuel Type ',
      'ar': 'نوع الوقود',
      'en': 'fuel type',
      'es': 'tipo de combustible',
      'ko': '연료 종류',
    },
    'zn9mef4k': {
      'ru': 'Petrol',
      'ar': 'بنزين',
      'en': 'Petrol',
      'es': 'Gasolina',
      'ko': '가솔린',
    },
    'dezaokwk': {
      'ru': 'Max Power (bhp@rpm)',
      'ar': 'أقصى قوة (bhp @ rpm)',
      'en': 'Max Power (bhp@rpm)',
      'es': 'Potencia máxima (bhp@rpm)',
      'ko': '최대 출력(bhp@rpm)',
    },
    'fte8qpws': {
      'ru': '641.00bhp@6500',
      'ar': '641.00bhp@6500',
      'en': '641.00bhp@6500',
      'es': '641.00bhp@6500',
      'ko': '641.00bhp@6500',
    },
    'qfav8hk6': {
      'ru': 'Seating Capacity',
      'ar': 'سعة الجلوس',
      'en': 'seating capacity',
      'es': 'número de plazas',
      'ko': '좌석 수',
    },
    '5d25xzjn': {
      'ru': '2',
      'ar': '2',
      'en': '2',
      'es': '2',
      'ko': '2',
    },
    '3frqgzej': {
      'ru': 'Transmission Type',
      'ar': 'نوع التحويل',
      'en': 'transmission type',
      'es': 'tipo de transmisión',
      'ko': '전송 유형',
    },
    'r5lepaf7': {
      'ru': 'Automatic',
      'ar': 'تلقائي',
      'en': 'Automatic',
      'es': 'Automático',
      'ko': '자동적 인',
    },
    'ibx5jke2': {
      'ru': 'Tank Capacity',
      'ar': 'سعة الخزان',
      'en': 'tank capacity',
      'es': 'capacidad del tanque',
      'ko': '탱크 용량',
    },
    'b599lfqg': {
      'ru': '64.0',
      'ar': '64.0',
      'en': '64.0',
      'es': '64.0',
      'ko': '64.0',
    },
    'iddzjb26': {
      'ru': 'Перед началом путешествия машина\nзаправлена до полного бака.',
      'ar': 'قبل بدء الرحلة ، تمتلئ السيارة إلى خزان ممتلئ.',
      'en': 'Before starting the trip, the car is filled up to a full tank.',
      'es':
          'Antes de iniciar el viaje, el auto se llena hasta el tanque lleno.',
      'ko': '여행을 시작하기 전에 차는 가득 차 있습니다.',
    },
    'ar9hcqzj': {
      'ru': 'BACK',
      'ar': 'الى الخلف',
      'en': 'BACK',
      'es': 'ESPALDA',
      'ko': '뒤',
    },
    'ob7w7y5l': {
      'ru': 'Home',
      'ar': 'مسكن',
      'en': 'Home',
      'es': 'Hogar',
      'ko': '집',
    },
  },
  // AboutPlace
  {
    'stgexjii': {
      'ru': 'Cabo da Roca — Nazare. Portugal',
      'ar': 'كابو دا روكا - نازاري. البرتغال',
      'en': 'Cabo da Roca - Nazare. Portugal',
      'es': 'Cabo da Roca - Nazaré. Portugal',
      'ko': '카보 다 로카 - 나자레. 포르투갈',
    },
    'a0jpj9v9': {
      'ru': '10 октября — 12 октября, 2022',
      'ar': '10 أكتوبر - 12 أكتوبر 2022',
      'en': 'October 10 — October 12, 2022',
      'es': '10 de octubre — 12 de octubre de 2022',
      'ko': '2022년 10월 10일 — 10월 12일',
    },
    '5yrehsu0': {
      'ru': 'Porsche 911 Carrera GTS',
      'ar': 'بورش 911 كاريرا جي تي إس',
      'en': 'Porsche 911 Carrera GTS',
      'es': 'Porsche 911 Carrera GTS',
      'ko': '포르쉐 911 카레라 GTS',
    },
    '8q31xc2m': {
      'ru': 'CABO DA ROCE',
      'ar': 'CABO DA ROCE',
      'en': 'CABO DA ROCE',
      'es': 'CABO DA ROCE',
      'ko': '카보다 로체',
    },
    '4glnwve2': {
      'ru':
          'Libero et saepe ipsa cum. Recusandae aut nostrum odit rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Esse officiis inventore voluptates inventore adipisci itaque nostrum. Repudiandae ea et modi veniam.',
      'ar':
          'Libero et saepe ipsa cum. Recusandae aut nostrum odit rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores سايب طارد. Esse officiis يخترع voluptates يخترع adipisci itaque nostrum. Repudiandae ea et modi veniam.',
      'en':
          'Libero et saepe ipsa cum. Recusandae aut nostrum odit rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Esse officiis inventore voluptates inventore adipisci itaque nostrum. Repudiandae ea et modi veniam.',
      'es':
          'Líbero et saepe ipsa cum. Recusandae aut nostrum odit rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Esse officiis inventore voluptates inventore adipisci itaque nostrum. Repudiandae ea et modi veniam.',
      'ko':
          'Libero et saepe ipsa cum. Recusandae aut nostrum odit rem id aut quo. Pariatur reprehenderit asperiores. Fugit ut quia totam optio tenetur. Repudiandae asperiores saepe repellat. Esse officiis Inventore는 Inventore adipisci itaque nostrum을 휘젓습니다. Repudiandae ea et modi veniam.',
    },
    'wc13eicg': {
      'ru': 'Home',
      'ar': 'مسكن',
      'en': 'Home',
      'es': 'Hogar',
      'ko': '집',
    },
  },
  // TakeaCar
  {
    '6svfki8i': {
      'ru': 'Как забрать машину?',
      'ar': 'كيف تلتقط سيارة؟',
      'en': 'How to pick up a car?',
      'es': '¿Cómo recoger un coche?',
      'ko': '차를 픽업하는 방법?',
    },
    '6ssfhhxv': {
      'ru': '1.',
      'ar': 'واحد.',
      'en': 'one.',
      'es': 'una.',
      'ko': '하나.',
    },
    'u7nhlxdg': {
      'ru':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ar':
          'Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'en':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'es':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ko':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
    },
    'fdj7mntn': {
      'ru': '2.',
      'ar': '2.',
      'en': '2.',
      'es': '2.',
      'ko': '2.',
    },
    '5u4e5qvb': {
      'ru':
          'Qui exercitationem esse nisi neque. Culpa  atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ar':
          'Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'en':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'es':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ko':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
    },
    'b9quzzbu': {
      'ru': '3.',
      'ar': '3.',
      'en': '3.',
      'es': '3.',
      'ko': '삼.',
    },
    '99k6tb6g': {
      'ru':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ar':
          'Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'en':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'es':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ko':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
    },
    'au7ammyh': {
      'ru': '4.',
      'ar': 'أربعة.',
      'en': 'four.',
      'es': 'cuatro',
      'ko': '넷.',
    },
    'xed7h1y4': {
      'ru':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ar':
          'Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'en':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'es':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ko':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
    },
    'umam7q00': {
      'ru': 'Как вернуть машину?',
      'ar': 'كيف تعيد السيارة؟',
      'en': 'How to return the car?',
      'es': '¿Cómo devolver el coche?',
      'ko': '차를 반환하는 방법?',
    },
    'eqq3go5j': {
      'ru': '1.',
      'ar': 'واحد.',
      'en': 'one.',
      'es': 'una.',
      'ko': '하나.',
    },
    'g0otsgq7': {
      'ru':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ar':
          'Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'en':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'es':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ko':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
    },
    'u9qkifgy': {
      'ru': '2.',
      'ar': '2.',
      'en': '2.',
      'es': '2.',
      'ko': '2.',
    },
    '76idyil3': {
      'ru':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ar':
          'Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'en':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'es':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ko':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
    },
    '82oj8u5k': {
      'ru': '2.',
      'ar': '2.',
      'en': '2.',
      'es': '2.',
      'ko': '2.',
    },
    'gugd0pvv': {
      'ru':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ar':
          'Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'en':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'es':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
      'ko':
          'Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem.',
    },
    'a7jpg6lr': {
      'ru': 'Home',
      'ar': 'مسكن',
      'en': 'Home',
      'es': 'Hogar',
      'ko': '집',
    },
  },
  // Settings
  {
    '7plcb94k': {
      'ru': 'НАСТРОЙКИ',
      'ar': '',
      'en': '',
      'es': '',
      'ko': '',
    },
    '16gdwltg': {
      'ru': 'ВЫБОР ЯЗЫКА ПРИЛОЖЕНИЯ',
      'ar': 'اختيار لغة التطبيق',
      'en': 'SELECTING THE APP LANGUAGE',
      'es': 'SELECCIÓN DEL IDIOMA DE LA APLICACIÓN',
      'ko': '앱 언어 선택',
    },
    '6jozw576': {
      'ru': 'Английский',
      'ar': 'إنجليزي',
      'en': 'English',
      'es': 'inglés',
      'ko': '영어',
    },
    'fa0r9lig': {
      'ru': 'Русский',
      'ar': 'الروسية',
      'en': 'Russian',
      'es': 'ruso',
      'ko': '러시아인',
    },
    'eliae8ow': {
      'ru': 'Испанский',
      'ar': 'الأسبانية',
      'en': 'Spanish',
      'es': 'español',
      'ko': '스페인의',
    },
    'tut5rnqw': {
      'ru': 'Японский',
      'ar': 'اليابانية',
      'en': 'Japanese',
      'es': 'japonés',
      'ko': '일본어',
    },
    'gqkc77hj': {
      'ru': 'Арабский',
      'ar': 'عرب',
      'en': 'Arab',
      'es': 'árabe',
      'ko': '아라비아 사람',
    },
    'wambaw0q': {
      'ru': 'ЯЗЫК НАВИГАТОРА',
      'ar': 'لغة الملاح',
      'en': 'NAVIGATOR LANGUAGE',
      'es': 'IDIOMA DEL NAVEGADOR',
      'ko': '네비게이터 언어',
    },
    '9iej4zks': {
      'ru': 'Английский',
      'ar': 'إنجليزي',
      'en': 'English',
      'es': 'inglés',
      'ko': '영어',
    },
    'j4e04641': {
      'ru': 'Русский',
      'ar': 'الروسية',
      'en': 'Russian',
      'es': 'ruso',
      'ko': '러시아인',
    },
    'bo3p5ws7': {
      'ru': 'Испанский',
      'ar': 'الأسبانية',
      'en': 'Spanish',
      'es': 'español',
      'ko': '스페인의',
    },
    'zczu0t3j': {
      'ru': 'Японский',
      'ar': 'اليابانية',
      'en': 'Japanese',
      'es': 'japonés',
      'ko': '일본어',
    },
    'yipwsz88': {
      'ru': 'Арабский',
      'ar': 'عرب',
      'en': 'Arab',
      'es': 'árabe',
      'ko': '아라비아 사람',
    },
    '1fyo3e10': {
      'ru': 'ГОЛОС НАВИГАТОРА',
      'ar': 'صوت الملاح',
      'en': 'NAVIGATOR&#39;S VOICE',
      'es': 'VOZ DEL NAVEGANTE',
      'ko': '네비게이터의 목소리',
    },
    'mcgb5rmy': {
      'ru': 'Женский',
      'ar': 'أنثى',
      'en': 'Female',
      'es': 'Femenino',
      'ko': '여성',
    },
    '0mw6hmeq': {
      'ru': 'Мужской',
      'ar': 'ذكر',
      'en': 'Male',
      'es': 'Masculino',
      'ko': '남성',
    },
    'a5uwsc6g': {
      'ru': 'ЗВУКОВЫЕ ПОДСКАЗКИ',
      'ar': 'أدلة صوتية',
      'en': 'AUDIO CLUES',
      'es': 'PISTAS DE AUDIO',
      'ko': '오디오 단서',
    },
    '9qd8062v': {
      'ru': 'Включить',
      'ar': 'شغله',
      'en': 'Turn on',
      'es': 'Encender',
      'ko': '켜다',
    },
    'o6t7q7lo': {
      'ru': 'Выключить',
      'ar': 'اطفيء',
      'en': 'Switch off',
      'es': 'Apagar',
      'ko': '끄다',
    },
    'e274okr1': {
      'ru': 'ВИД НАВИГАТОРА',
      'ar': 'عرض الملاح',
      'en': 'NAVIGATOR VIEW',
      'es': 'VISTA DEL NAVEGADOR',
      'ko': '네비게이터 보기',
    },
    '4eezqmjj': {
      'ru': 'Светлый',
      'ar': 'ضوء ملون',
      'en': 'Light coloured',
      'es': 'De color claro',
      'ko': '밝은 색',
    },
    'm1dh6uwm': {
      'ru': 'Темный',
      'ar': 'مظلم',
      'en': 'Dark',
      'es': 'Oscuro',
      'ko': '어두운',
    },
    's7zcsmgi': {
      'ru': 'ЭКСТРЕННЫЙ ВЫЗОВ',
      'ar': 'مكالمة طارئة',
      'en': 'EMERGENCY CALL',
      'es': 'LLAMADA DE EMERGENCIA',
      'ko': '긴급 전화',
    },
  },
  // Help
  {
    '4mk47x8w': {
      'ru': 'ПОМОЩЬ',
      'ar': 'يساعد',
      'en': 'HELP',
      'es': 'AYUDA',
      'ko': '돕다',
    },
    'xyqcahji': {
      'ru': 'КАК ИСПОЛЬЗОВАТЬ ПРИЛОЖЕНИЕ',
      'ar': 'كيفية استخدام التطبيق',
      'en': 'HOW TO USE THE APP',
      'es': 'CÓMO USAR LA APLICACIÓN',
      'ko': '앱 사용 방법',
    },
    'm1wetc6o': {
      'ru':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ar':
          '1. Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'en':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'es':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ko':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
    },
    '25264jzx': {
      'ru': 'ИНФОРМАЦИЯ О НАВИГАТОРЕ',
      'ar': 'معلومات عن الملاح',
      'en': 'INFORMATION ABOUT THE NAVIGATOR',
      'es': 'INFORMACIÓN SOBRE EL NAVEGADOR',
      'ko': '네비게이터에 대한 정보',
    },
    'kdf4vzqq': {
      'ru':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ar':
          '1. Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'en':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'es':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ko':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
    },
    '4bo2nc9i': {
      'ru': 'КАК ЗАБРАТЬ МАШИНУ',
      'ar': 'كيف تلتقط السيارة',
      'en': 'HOW TO PICK UP THE CAR',
      'es': 'CÓMO RECOGER EL COCHE',
      'ko': '차량 인수 방법',
    },
    '9zllze7o': {
      'ru':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ar':
          '1. Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'en':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'es':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ko':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
    },
    'teqxns7s': {
      'ru': 'КАК ВЕРНУТЬ МАШИНУ',
      'ar': 'كيفية إعادة السيارة',
      'en': 'HOW TO RETURN THE CAR',
      'es': 'CÓMO DEVOLVER EL COCHE',
      'ko': '자동차 반납 방법',
    },
    'vw2rgm6j': {
      'ru':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ar':
          '1. Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'en':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'es':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ko':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
    },
    'lue0b4ly': {
      'ru': 'ПРАВИЛА ИСПОЛЬЗОВАНИЯ АВТОМОБИЛЯ',
      'ar': 'قواعد استخدام السيارة',
      'en': 'RULES FOR USE OF THE CAR',
      'es': 'NORMAS PARA EL USO DEL COCHE',
      'ko': '자동차 사용 규칙',
    },
    '3l9ry3b7': {
      'ru':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ar':
          '1. Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'en':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'es':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ko':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
    },
    'pzfzjigy': {
      'ru': 'ПРАВИЛА ПОЛЬЗОВАНИЯ БРОНЬЮ В ОТЕЛЕ',
      'ar': 'شروط وأحكام حجز الفنادق',
      'en': 'HOTEL BOOKING TERMS AND CONDITIONS',
      'es': 'TÉRMINOS Y CONDICIONES DE RESERVA DE HOTELES',
      'ko': '호텔 예약 약관',
    },
    'fi6x7k2f': {
      'ru':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ar':
          '1. Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'en':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'es':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ko':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
    },
    '22lgbxln': {
      'ru': 'СТРАХОВАНИЕ ОТВЕТСТВЕННОСТИ',
      'ar': 'تأمين المسؤولية',
      'en': 'LIABILITY INSURANCE',
      'es': 'SEGURO DE RESPONSABILIDAD',
      'ko': '책임 보험',
    },
    'ohgejlab': {
      'ru':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ar':
          '1. Qui Practiceem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'en':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'es':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
      'ko':
          '1. Qui exercitationem esse nisi neque. Culpa atque aliquam ad dolorem nisi molestiae sint voluptatem. Nemo sunt similique aspernatur voluptatum quo omnis debitis harum odit.',
    },
    'tr5bmiz0': {
      'ru': 'ЗАДАТЬ ВОПРОС',
      'ar': 'طرح سؤال',
      'en': 'ASK A QUESTION',
      'es': 'HACER UNA PREGUNTA',
      'ko': '질문하기',
    },
  },
  // Questions
  {
    'a1n3jhbi': {
      'ru': 'Задать вопрос',
      'ar': '',
      'en': '',
      'es': '',
      'ko': '',
    },
    'orhcvxy9': {
      'ru': 'Ваше имя',
      'ar': 'اسمك',
      'en': 'Your name',
      'es': 'Su nombre',
      'ko': '당신의 이름',
    },
    '86qwtp9a': {
      'ru': 'Email',
      'ar': 'البريد الإلكتروني',
      'en': 'Email',
      'es': 'Correo electrónico',
      'ko': '이메일',
    },
    'u9oeq7w1': {
      'ru': 'Начните писать',
      'ar': 'ابدأ الكتابة',
      'en': 'start writing',
      'es': 'Empieza a escribir',
      'ko': '쓰기 시작',
    },
    'wxepaaij': {
      'ru': 'SEND',
      'ar': 'إرسال',
      'en': 'SEND',
      'es': 'ENVIAR',
      'ko': '보내다',
    },
    '1hd7ebwe': {
      'ru': 'Ответ на ваш вопрос мы отправим на e-mail',
      'ar': 'سنرسل إجابة سؤالك عبر البريد الإلكتروني',
      'en': 'We will send the answer to your question by e-mail',
      'es': 'Le enviaremos la respuesta a su pregunta por correo electrónico.',
      'ko': '질문에 대한 답변을 이메일로 보내드립니다',
    },
    'wsofpb41': {
      'ru': 'Home',
      'ar': 'مسكن',
      'en': 'Home',
      'es': 'Hogar',
      'ko': '집',
    },
  },
  // SUPPORT
  {
    'agz50okh': {
      'ru': 'СЛУЖБА ПОДДЕРЖКИ',
      'ar': 'الدعم',
      'en': 'SUPPORT',
      'es': 'APOYO',
      'ko': '지원하다',
    },
    'l0ff1ngm': {
      'ru': 'СПАСИБО',
      'ar': 'شكرًا',
      'en': 'THANKS',
      'es': 'GRACIAS',
      'ko': '감사해요',
    },
    'f25pvfm9': {
      'ru':
          'Валерий, здравствуйте! Спасибо, что обратились в службу поддержки. Мы постараемся ответить на ваш вопрос как можно быстрее и пришлем ответ вам на почту. ',
      'ar':
          'فاليري ، مرحبا! شكرا لك على الاتصال بالدعم. سنحاول الإجابة على سؤالك في أسرع وقت ممكن ونرسل لك إجابة عبر البريد الإلكتروني.',
      'en':
          'Valery, hello! Thank you for contacting support. We will try to answer your question as quickly as possible and send you an answer by email.',
      'es':
          'Valery, hola! Gracias por ponerse en contacto con el soporte. Intentaremos responder a su pregunta lo más rápido posible y le enviaremos una respuesta por correo electrónico.',
      'ko':
          '발레리, 안녕! 지원팀에 문의해 주셔서 감사합니다. 귀하의 질문에 최대한 빨리 답변을 드리고 이메일로 답변을 보내드릴 수 있도록 노력하겠습니다.',
    },
    'ddyicczm': {
      'ru': 'OK',
      'ar': 'نعم',
      'en': 'OK',
      'es': 'OK',
      'ko': '확인',
    },
    'ujxr0zqq': {
      'ru': 'Home',
      'ar': 'مسكن',
      'en': 'Home',
      'es': 'Hogar',
      'ko': '집',
    },
  },
  // search
  {
    '1nw9pklc': {
      'ru': 'OK',
      'ar': 'نعم',
      'en': 'OK',
      'es': 'OK',
      'ko': '확인',
    },
  },
  // Miscellaneous
  {
    'innpeagl': {
      'ru': '',
      'ar': '',
      'en': '',
      'es': '',
      'ko': '',
    },
    '9xerdrne': {
      'ru': '',
      'ar': '',
      'en': '',
      'es': '',
      'ko': '',
    },
    'se7vxgf1': {
      'ru': '',
      'ar': '',
      'en': '',
      'es': '',
      'ko': '',
    },
    'gp16g5ez': {
      'ru': '',
      'ar': '',
      'en': '',
      'es': '',
      'ko': '',
    },
    'gjtl5hwc': {
      'ru': '',
      'ar': '',
      'en': '',
      'es': '',
      'ko': '',
    },
    'c2yfo6vb': {
      'ru': '',
      'ar': '',
      'en': '',
      'es': '',
      'ko': '',
    },
    'nm8ajz7e': {
      'ru': '',
      'ar': '',
      'en': '',
      'es': '',
      'ko': '',
    },
    '5brpwvu3': {
      'ru': '',
      'ar': '',
      'en': '',
      'es': '',
      'ko': '',
    },
    '17nqubbu': {
      'ru': '',
      'ar': '',
      'en': '',
      'es': '',
      'ko': '',
    },
    'ob8k3ox2': {
      'ru': '',
      'ar': '',
      'en': '',
      'es': '',
      'ko': '',
    },
    's7lstziv': {
      'ru': '',
      'ar': '',
      'en': '',
      'es': '',
      'ko': '',
    },
    '0ajd038e': {
      'ru': '',
      'ar': '',
      'en': '',
      'es': '',
      'ko': '',
    },
    'odlv0s08': {
      'ru': '',
      'ar': '',
      'en': '',
      'es': '',
      'ko': '',
    },
    '31le5rl2': {
      'ru': '',
      'ar': '',
      'en': '',
      'es': '',
      'ko': '',
    },
    'zgsqy388': {
      'ru': '',
      'ar': '',
      'en': '',
      'es': '',
      'ko': '',
    },
    'xw588pyc': {
      'ru': '',
      'ar': '',
      'en': '',
      'es': '',
      'ko': '',
    },
    'xitmwstb': {
      'ru': '',
      'ar': '',
      'en': '',
      'es': '',
      'ko': '',
    },
    '24pnytp0': {
      'ru': '',
      'ar': '',
      'en': '',
      'es': '',
      'ko': '',
    },
    '6kiehx04': {
      'ru': '',
      'ar': '',
      'en': '',
      'es': '',
      'ko': '',
    },
    '4w8rb4v9': {
      'ru': '',
      'ar': '',
      'en': '',
      'es': '',
      'ko': '',
    },
    'ppezs9d7': {
      'ru': '',
      'ar': '',
      'en': '',
      'es': '',
      'ko': '',
    },
  },
].reduce((a, b) => a..addAll(b));
