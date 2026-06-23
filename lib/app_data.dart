import './models/category.dart';
import './models/trip.dart';

const List<Category> categoriesData = [
  Category(
    id: 'c1',
    title: 'جبال',
    imageUrl:
        'https://images.unsplash.com/photo-1575728252059-db43d03fc2de?auto=format&fit=crop&w=400&q=60',
  ),
  Category(
    id: 'c2',
    title: 'بحيرات',
    imageUrl:
        'https://images.unsplash.com/photo-1501785888041-af3ef285b470?auto=format&fit=crop&w=400&q=60',
  ),
  Category(
    id: 'c3',
    title: 'شواطىء',
    imageUrl:
        'https://images.unsplash.com/photo-1493558103817-58b2924bce98?auto=format&fit=crop&w=400&q=60',
  ),
  Category(
    id: 'c4',
    title: 'صحارى',
    imageUrl:
        'https://images.unsplash.com/photo-1473580044384-7ba9967e16a0?auto=format&fit=crop&w=400&q=60',
  ),
  Category(
    id: 'c5',
    title: 'مدن تاريخية',
    imageUrl:
        'https://images.unsplash.com/photo-1467269204594-9661b134dd2b?auto=format&fit=crop&w=400&q=60',
  ),
  Category(
    id: 'c6',
    title: 'أخرى',
    imageUrl:
        'https://images.unsplash.com/photo-1605540436563-5bca919ae766?auto=format&fit=crop&w=400&q=60',
  ),
];

const List<Trip> tripsData = [
  Trip(
    id: 'm1',
    categories: ['c1'],
    title: 'جبال الألب',
    tripType: TripType.Exploration,
    season: Season.Winter,
    imageUrl:
        'https://images.unsplash.com/photo-1611523658822-385aa008324c?auto=format&fit=crop&w=600&q=60',
    duration: 20,
    activities: [
      'زيارة المواقع الأثرية',
      'جولة سياحية على الأقدام',
      'زيارة المراكز التجارية',
      'تناول وجبة الغداء',
      'الاستمتاع بالمناظر الطبيعية'
    ],
    program: [
      'برنامج يوم 1',
      'برنامج يوم 2',
      'برنامج يوم 3',
    ],
    isInSummer: false,
    isForFamilies: true,
    isInWinter: true,
  ),
  Trip(
    id: 'm2',
    categories: ['c2'],
    title: 'البحيرة الكبرى',
    tripType: TripType.Activities,
    season: Season.Spring,
    imageUrl:
        'https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?auto=format&fit=crop&w=600&q=60',
    duration: 10,
    activities: [
      'جولة بالقارب',
      'زيارة المواقع الطبيعية',
      'التخييم'
    ],
    program: [
      'استقبال',
      'جولة صباحية',
      'أنشطة مسائية',
    ],
    isInSummer: true,
    isForFamilies: true,
    isInWinter: false,
  ),
  Trip(
    id: 'm3',
    categories: ['c3'],
    title: 'شاطئ الرمال الذهبية',
    tripType: TripType.Recovery,
    season: Season.Summer,
    imageUrl:
        'https://images.unsplash.com/photo-1519046904884-53103b34b206?auto=format&fit=crop&w=600&q=60',
    duration: 7,
    activities: [
      'سباحة',
      'رياضات بحرية',
      'استرخاء'
    ],
    program: [
      'يوم استرخاء',
      'أنشطة بحرية',
      'جولة حرة',
    ],
    isInSummer: true,
    isForFamilies: true,
    isInWinter: false,
  ),
  Trip(
    id: 'm4',
    categories: ['c4'],
    title: 'الصحراء الكبرى',
    tripType: TripType.Activities,
    season: Season.Winter,
    imageUrl:
        'https://images.unsplash.com/photo-1473580044384-7ba9967e16a0?auto=format&fit=crop&w=600&q=60',
    duration: 5,
    activities: [
      'رحلة سفاري',
      'ركوب الجمال',
      'سهرات بدوية'
    ],
    program: [
      'انطلاق',
      'سفاري',
      'مخيم ليلي',
    ],
    isInSummer: false,
    isForFamilies: true,
    isInWinter: true,
  ),
  Trip(
  id: 'm5',
  categories: ['c5'],
  title: 'روما التاريخية',
  tripType: TripType.Exploration,
  season: Season.Spring,
  imageUrl:
      'https://images.unsplash.com/photo-1526481280691-9067c2b1b3e7?auto=format&fit=crop&w=600&q=60',
  duration: 6,
  activities: [
    'زيارة الكولوسيوم',
    'جولة في المدينة القديمة',
    'زيارة المتاحف'
  ],
  program: [
    'جولة تاريخية',
    'زيارة المعالم',
    'وقت حر'
  ],
  isInSummer: true,
  isForFamilies: true,
  isInWinter: false,
),
Trip(
  id: 'm6',
  categories: ['c6'],
  title: 'رحلة مفاجآت',
  tripType: TripType.Activities,
  season: Season.Summer,
  imageUrl:
      'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=600&q=60',
  duration: 8,
  activities: [
    'نشاط خاص',
    'مغامرة جديدة',
    'تجربة مختلفة'
  ],
  program: [
    'يوم مغامرة',
    'أنشطة متنوعة',
    'استكشاف حر'
  ],
  isInSummer: true,
  isForFamilies: false,
  isInWinter: false,
),

];
