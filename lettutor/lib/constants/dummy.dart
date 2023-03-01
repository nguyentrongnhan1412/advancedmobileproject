import 'package:lettutor/entities/course.dart';
import 'package:lettutor/entities/book.dart';
import 'package:lettutor/entities/review.dart';
import 'package:lettutor/entities/teacher.dart';

const nationalities = [
  'Foreign Tutor',
  'Native English Tutor',
  'Vietnamese Tutor',
];

const levels = [
  'Pre A1 (Beginner)',
  'A1 (Higher Beginner)',
  'A2 (Pre-Intermediate)',
  'B1 (Intermediate)',
  'B2 (Upper-Intermediate)',
  'C1 (Advanced)',
  'C2 (Proficiency)',
];

const subjects = [
  'English for kids',
  'English for Business',
  'Conversational',
];

const testPreparations = [
  'STARTERS',
  'MOVERS',
  'FLYERS',
  'KET',
  'PET',
  'IELTS',
  'TOEFL',
  'TOEIC'
];

const filters = [
  'All',
  'English for kids',
  'English for Business',
  'Conversational',
  'STARTERS',
  'MOVERS',
  'FLYERS',
  'KET',
  'PET',
  'IELTS',
  'TOEFL',
  'TOEIC'
];

const teachers = [
  Teacher(
      'Keegan',
      'assets/tutors/keegan-avatar.png',
      'France',
      5,
      60,
      'I am passionate about running and fitness, '
          'I often compete in trail/mountain running events and I love pushing myself. '
          'I am training to one day take part in ultra-endurance events. '
          'I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. '
          'My most memorable life experience would be living in and traveling around Southeast Asia.',
      [
        'English for kids',
        'English for Business',
        'Conversational',
        'IELTS',
        'TOEFL',
        'TOEIC'
      ]),
  Teacher(
      'Jill Leano',
      'assets/tutors/jill-leano-avatar.png',
      'France',
      4,
      9,
      "Hi, My name is Jill I am an experienced English Teacher from Philippine. "
          "I would like to share my enthusiasm with the learners in this platform. "
          "I've been working with diverse learners of all levels for many years. "
          "I am greatly passionate about about profession. I love teaching "
          "because I can help others improve their skills and it gives me joy and "
          "excitement meeting different learners around the world. "
          "In my class I worked with wonderful enthusiasm and positivity, "
          "and I'm happy to focus on my learner's goal.",
      [
        'English for kids',
        'English for Business',
        'Conversational',
        'IELTS',
        'TOEFL',
        'TOEIC'
      ]),
  Teacher(
      'April Baldo',
      'assets/tutors/april-baldo-avatar.png',
      'Philippine',
      4,
      22,
      "Hello! My name is April Baldo, you can just call me Teacher April. "
          "I am an English teacher and currently teaching in senior high school. "
          "I have been teaching grammar and literature for almost 10 years. "
          "I am fond of reading and teaching literature as one way of knowing one’s "
          "beliefs and culture. I am friendly and full of positivity. "
          "I love teaching because I know each student has something to bring on. "
          "Molding them to become an individual is a great success.",
      [
        'English for Business',
        'KET',
        'PET',
        'IELTS',
      ]),
  Teacher(
      'Joan Gacer',
      'assets/tutors/joan-gacer-avatar.png',
      'Taiwan',
      3,
      6,
      "I was a customer service sales executive for 3 years before I become an ESL teacher "
          "I am trained to deliver excellent service to my clients so I can help you with "
          "business English dealing with customers or in sales-related jobs and a lot more, "
          "I also love to teach beginner, intermediate and advance I speak slowly and "
          "clearly so that the student can easily follow my instructions and pronunciation. "
          "In my class, I want environment-friendly fun and engaging I have many activities "
          "designed to help your enthusiasm in learning the language. I'm so excited to "
          "meet you in one of my classes let us have fun while learning English. See you there.",
      [
        'English for kids',
        'English for Business',
        'Conversational',
        'STARTERS',
        'MOVERS',
        'FLYERS',
        'KET',
        'PET',
        'IELTS',
        'TOEFL',
        'TOEIC'
      ]),
];

const courses = [
  Course(
    'Life in the Internet Age',
    'assets/courses/course-01.png',
    "Let's discuss how technology is changing the way we live",
    'Intermediate',
    9,
  ),
  Course(
    'Caring for Our Planet',
    'assets/courses/course-02.png',
    "Let's discuss our relationship as humans with our planet, Earth",
    'Intermediate',
    7,
  ),
  Course(
    'Healthy Mind, Healthy Body',
    'assets/courses/course-03.png',
    "Let's discuss the many aspects of living a long, happy life",
    'Intermediate',
    6,
  ),
  Course(
    'Movies and Television',
    'assets/courses/course-04.png',
    "Let's discuss our preferences and habits surrounding movies and television shows",
    'Beginner',
    10,
  ),
  Course(
    'Raising Children',
    'assets/courses/course-05.png',
    "Let's discuss raising children and practice using English for common parenting situations",
    'Intermediate',
    11,
  ),
  Course(
    'The Olympics',
    'assets/courses/course-06.png',
    "Let’s practice talking about the Olympics, the biggest sports festival on earth!",
    'Advanced',
    8,
  ),
];

const courseTopics = [
  'The Internet',
  'Artificial Intelligence (AI)',
  'Social Media',
  'Internet Privacy',
  'Live Streaming',
  'Programming',
  'Technology Transforming Healthcare',
  'Smart Home Technology',
  'Remote Work - A Dream Job?',
];

const books = [
  Book(
      'Family and Friends 1',
      "For kids who can read pretty well, get ready for compound sentences and...",
      'Upper-Beginner',
      'assets/books/familyandfriends.jpg'),
  Book(
      'Family and Friends 2',
      "For kids who can read pretty well, get ready for compound sentences and...",
      'Upper-Beginner',
      'assets/books/familyandfriends.jpg'),
  Book(
      'Family and Friends 3',
      "For kids who can read pretty well, get ready for compound sentences and...",
      'Upper-Beginner',
      'assets/books/familyandfriends.jpg'),
  Book(
      'Everybody Up',
      "For: kids who want to learn English through pictures, pick up simple...",
      'Beginner',
      'assets/books/everybodyup.jpg'),
  Book(
      'Cambridge Storyfun For Starter',
      "For kids who can handle single words and simple sentences with assistance.",
      'Beginner',
      'assets/books/storyfun.jpg'),
  Book(
      'Headway 5th Edition',
      "For teenagers who want to form a grammatical background as well as...",
      'Beginner',
      'assets/books/headway.jpg'),
  Book(
      'English World ',
      "For kids who are able to pick up simple sounds, letters, words and learn new...",
      'Beginner',
      'assets/books/englishworld.jpg'),
];

const courseHours = [
  '00:00 - 00:25',
  '00:30 - 00:55',
  '01:00 - 01:25',
  '01:30 - 01:55',
  '02:00 - 02:25',
  '02:30 - 02:55',
  '03:00 - 03:25',
  '03:30 - 03:55',
  '04:00 - 04:25',
  '04:30 - 04:55',
  '05:00 - 05:25',
  '05:30 - 05:55',
  '06:00 - 06:25',
  '06:30 - 06:55',
  '07:00 - 07:25',
  '07:30 - 07:55',
  '08:00 - 08:25',
  '08:30 - 08:55',
  '09:00 - 09:25',
  '09:30 - 09:55',
  '10:00 - 10:25',
  '10:30 - 10:55',
  '11:00 - 11:25',
  '11:30 - 11:55',
  '12:00 - 12:25',
  '12:30 - 12:55',
  '13:00 - 13:25',
  '13:30 - 13:55',
  '14:00 - 14:25',
  '14:30 - 14:55',
  '15:00 - 15:25',
  '15:30 - 15:55',
  '16:00 - 16:25',
  '16:30 - 16:55',
  '17:00 - 17:25',
  '17:30 - 17:55',
  '18:00 - 18:25',
  '18:30 - 18:55'
];

const reviews = [
  Review('phuchien108', 'This tutor is great', 5),
  Review('chienngo', 'He is very kind', 4),
  Review('ttkha', 'This tutor always come late', 2),
  Review('khadogg', 'He does not know how to teach apparently', 1),
  Review('npchien', 'I am out of idea for review', 3),
  Review('bedekhapmotmienque', 'No idea what to say either', 4),
  Review('lohongcuateam', 'Neither do I', 2),
  Review('baonha', 'Wonderful', 5),
  Review('duakvuitoidacang', 'Not very useful tips', 2),
];

const countryList = {
  "AF": "Afghanistan",
  "AL": "Albania",
  "DZ": "Algeria",
  "AS": "American Samoa",
  "AD": "Andorra",
  "AO": "Angola",
  "AI": "Anguilla",
  "AQ": "Antarctica",
  "AG": "Antigua and Barbuda",
  "AR": "Argentina",
  "AM": "Armenia",
  "AW": "Aruba",
  "AU": "Australia",
  "AT": "Austria",
  "AZ": "Azerbaijan",
  "BS": "Bahamas (the)",
  "BH": "Bahrain",
  "BD": "Bangladesh",
  "BB": "Barbados",
  "BY": "Belarus",
  "BE": "Belgium",
  "BZ": "Belize",
  "BJ": "Benin",
  "BM": "Bermuda",
  "BT": "Bhutan",
  "BO": "Bolivia (Plurinational State of)",
  "BQ": "Bonaire, Sint Eustatius and Saba",
  "BA": "Bosnia and Herzegovina",
  "BW": "Botswana",
  "BV": "Bouvet Island",
  "BR": "Brazil",
  "IO": "British Indian Ocean Territory (the)",
  "BN": "Brunei Darussalam",
  "BG": "Bulgaria",
  "BF": "Burkina Faso",
  "BI": "Burundi",
  "CV": "Cabo Verde",
  "KH": "Cambodia",
  "CM": "Cameroon",
  "CA": "Canada",
  "KY": "Cayman Islands (the)",
  "CF": "Central African Republic (the)",
  "TD": "Chad",
  "CL": "Chile",
  "CN": "China",
  "CX": "Christmas Island",
  "CC": "Cocos (Keeling) Islands (the)",
  "CO": "Colombia",
  "KM": "Comoros (the)",
  "CD": "Congo (the Democratic Republic of the)",
  "CG": "Congo (the)",
  "CK": "Cook Islands (the)",
  "CR": "Costa Rica",
  "HR": "Croatia",
  "CU": "Cuba",
  "CW": "Curaçao",
  "CY": "Cyprus",
  "CZ": "Czechia",
  "CI": "Côte d'Ivoire",
  "DK": "Denmark",
  "DJ": "Djibouti",
  "DM": "Dominica",
  "DO": "Dominican Republic (the)",
  "EC": "Ecuador",
  "EG": "Egypt",
  "SV": "El Salvador",
  "GQ": "Equatorial Guinea",
  "ER": "Eritrea",
  "EE": "Estonia",
  "SZ": "Eswatini",
  "ET": "Ethiopia",
  "FK": "Falkland Islands (the) [Malvinas]",
  "FO": "Faroe Islands (the)",
  "FJ": "Fiji",
  "FI": "Finland",
  "FR": "France",
  "GF": "French Guiana",
  "PF": "French Polynesia",
  "TF": "French Southern Territories (the)",
  "GA": "Gabon",
  "GM": "Gambia (the)",
  "GE": "Georgia",
  "DE": "Germany",
  "GH": "Ghana",
  "GI": "Gibraltar",
  "GR": "Greece",
  "GL": "Greenland",
  "GD": "Grenada",
  "GP": "Guadeloupe",
  "GU": "Guam",
  "GT": "Guatemala",
  "GG": "Guernsey",
  "GN": "Guinea",
  "GW": "Guinea-Bissau",
  "GY": "Guyana",
  "HT": "Haiti",
  "HM": "Heard Island and McDonald Islands",
  "VA": "Holy See (the)",
  "HN": "Honduras",
  "HK": "Hong Kong",
  "HU": "Hungary",
  "IS": "Iceland",
  "IN": "India",
  "ID": "Indonesia",
  "IR": "Iran (Islamic Republic of)",
  "IQ": "Iraq",
  "IE": "Ireland",
  "IM": "Isle of Man",
  "IL": "Israel",
  "IT": "Italy",
  "JM": "Jamaica",
  "JP": "Japan",
  "JE": "Jersey",
  "JO": "Jordan",
  "KZ": "Kazakhstan",
  "KE": "Kenya",
  "KI": "Kiribati",
  "KP": "Korea (the Democratic People's Republic of)",
  "KR": "Korea (the Republic of)",
  "KW": "Kuwait",
  "KG": "Kyrgyzstan",
  "LA": "Lao People's Democratic Republic (the)",
  "LV": "Latvia",
  "LB": "Lebanon",
  "LS": "Lesotho",
  "LR": "Liberia",
  "LY": "Libya",
  "LI": "Liechtenstein",
  "LT": "Lithuania",
  "LU": "Luxembourg",
  "MO": "Macao",
  "MG": "Madagascar",
  "MW": "Malawi",
  "MY": "Malaysia",
  "MV": "Maldives",
  "ML": "Mali",
  "MT": "Malta",
  "MH": "Marshall Islands (the)",
  "MQ": "Martinique",
  "MR": "Mauritania",
  "MU": "Mauritius",
  "YT": "Mayotte",
  "MX": "Mexico",
  "FM": "Micronesia (Federated States of)",
  "MD": "Moldova (the Republic of)",
  "MC": "Monaco",
  "MN": "Mongolia",
  "ME": "Montenegro",
  "MS": "Montserrat",
  "MA": "Morocco",
  "MZ": "Mozambique",
  "MM": "Myanmar",
  "NA": "Namibia",
  "NR": "Nauru",
  "NP": "Nepal",
  "NL": "Netherlands (the)",
  "NC": "New Caledonia",
  "NZ": "New Zealand",
  "NI": "Nicaragua",
  "NE": "Niger (the)",
  "NG": "Nigeria",
  "NU": "Niue",
  "NF": "Norfolk Island",
  "MP": "Northern Mariana Islands (the)",
  "NO": "Norway",
  "OM": "Oman",
  "PK": "Pakistan",
  "PW": "Palau",
  "PS": "Palestine, State of",
  "PA": "Panama",
  "PG": "Papua New Guinea",
  "PY": "Paraguay",
  "PE": "Peru",
  "PH": "Philippines (the)",
  "PN": "Pitcairn",
  "PL": "Poland",
  "PT": "Portugal",
  "PR": "Puerto Rico",
  "QA": "Qatar",
  "MK": "Republic of North Macedonia",
  "RO": "Romania",
  "RU": "Russian Federation (the)",
  "RW": "Rwanda",
  "RE": "Réunion",
  "BL": "Saint Barthélemy",
  "SH": "Saint Helena, Ascension and Tristan da Cunha",
  "KN": "Saint Kitts and Nevis",
  "LC": "Saint Lucia",
  "MF": "Saint Martin (French part)",
  "PM": "Saint Pierre and Miquelon",
  "VC": "Saint Vincent and the Grenadines",
  "WS": "Samoa",
  "SM": "San Marino",
  "ST": "Sao Tome and Principe",
  "SA": "Saudi Arabia",
  "SN": "Senegal",
  "RS": "Serbia",
  "SC": "Seychelles",
  "SL": "Sierra Leone",
  "SG": "Singapore",
  "SX": "Sint Maarten (Dutch part)",
  "SK": "Slovakia",
  "SI": "Slovenia",
  "SB": "Solomon Islands",
  "SO": "Somalia",
  "ZA": "South Africa",
  "GS": "South Georgia and the South Sandwich Islands",
  "SS": "South Sudan",
  "ES": "Spain",
  "LK": "Sri Lanka",
  "SD": "Sudan (the)",
  "SR": "Suriname",
  "SJ": "Svalbard and Jan Mayen",
  "SE": "Sweden",
  "CH": "Switzerland",
  "SY": "Syrian Arab Republic",
  "TW": "Taiwan",
  "TJ": "Tajikistan",
  "TZ": "Tanzania, United Republic of",
  "TH": "Thailand",
  "TL": "Timor-Leste",
  "TG": "Togo",
  "TK": "Tokelau",
  "TO": "Tonga",
  "TT": "Trinidad and Tobago",
  "TN": "Tunisia",
  "TR": "Turkey",
  "TM": "Turkmenistan",
  "TC": "Turks and Caicos Islands (the)",
  "TV": "Tuvalu",
  "UG": "Uganda",
  "UA": "Ukraine",
  "AE": "United Arab Emirates (the)",
  "GB": "United Kingdom of Great Britain and Northern Ireland (the)",
  "UM": "United States Minor Outlying Islands (the)",
  "US": "United States of America (the)",
  "UY": "Uruguay",
  "UZ": "Uzbekistan",
  "VU": "Vanuatu",
  "VE": "Venezuela (Bolivarian Republic of)",
  "VN": "Viet Nam",
  "VG": "Virgin Islands (British)",
  "VI": "Virgin Islands (U.S.)",
  "WF": "Wallis and Futuna",
  "EH": "Western Sahara",
  "YE": "Yemen",
  "ZM": "Zambia",
  "ZW": "Zimbabwe",
  "AX": "Åland Islands"
};