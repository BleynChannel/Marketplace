import 'package:marketplace/domain/entity/achievement.dart';
import 'package:marketplace/domain/entity/cart_product.dart';
import 'package:marketplace/domain/entity/desired.dart';
import 'package:marketplace/domain/entity/notification.dart';
import 'package:marketplace/domain/entity/product.dart';
import 'package:marketplace/domain/entity/profile.dart';

//TODO: Внести в entity
final debugPlatformsList = [
  'Windows',
  'Linux',
  'MacOS',
  'Android',
  'IOS',
  'Nintendo Switch',
  'PS4',
  'Xbox One',
  'PS5',
  'Oculus Rift',
  'HTC Vive',
  'Valve Index',
];

final debugProductList = [
  Product(
    title: 'Cyberpunk 2077',
    pathToImage: 'assets/images/products/cyberpunk.jpg',
    price: 999,
    oldPrice: 1999,
    discount: 0.5,
    releaseDate: DateTime.now(),
    genre: [
      'Shooters',
      'Adventure',
    ],
    stylistics: [
      'Realistic',
    ],
    platforms: [
      'Windows',
      'Linux',
      'MacOS',
    ],
    multiplayer: [
      'Single-player',
    ],
  ),
  Product(
    title: 'Stray',
    pathToImage: 'assets/images/products/stray.jpg',
    price: 699,
    oldPrice: 0,
    discount: 0,
    releaseDate: DateTime.now(),
    genre: [
      'Simulation',
      'Puzzlers',
      'Adventure',
      'Platformer',
    ],
    stylistics: [
      'Realistic',
    ],
    platforms: [
      'Windows',
      'Linux',
      'MacOS',
      'PS4',
      'Xbox One',
      'PS5',
    ],
    multiplayer: ['Single-player'],
  ),
  Product(
    title: 'Minecraft',
    pathToImage: 'assets/images/products/minecraft.jpg',
    price: 1299,
    oldPrice: 2499,
    discount: 0.48,
    releaseDate: DateTime.now(),
    genre: [
      'Sandbox',
      'Simulation',
      'Survival',
      'Adventure',
    ],
    stylistics: [
      'Fantasy',
    ],
    platforms: [
      'Windows',
      'Linux',
      'MacOS',
      'Android',
      'IOS',
      'Nintendo Switch',
      'PS4',
      'Xbox One',
      'PS5',
    ],
    multiplayer: [
      'Single-player',
      'Multi-player',
      'LAN',
      'Online',
      'PvP',
      'Co-op',
      'Cross-Platform',
    ],
  ),
];

final debugCartProductList = [
  CartProduct(
    product: debugProductList[0],
    count: 1,
  ),
  CartProduct(
    product: debugProductList[1],
    count: 1,
  ),
  CartProduct(
    product: debugProductList[2],
    count: 1,
  ),
];

final debugDesiredList = [
  Desired(product: debugProductList[0]),
  Desired(product: debugProductList[1]),
  Desired(product: debugProductList[2]),
];

final debugNotification = [
  Notification(
    title: "Autumn discounts",
    pathToImage: 'assets/images/notification_discount_image.jpg',
    description: 'Get a 50% discount on the purchase of mobile games.',
  ),
];

final debugProfile = Profile(
  nickname: "Adam Harris",
  pathToAvatar: "assets/images/avatar.png",
  pathToBackgroundImage: "assets/images/profile_wallpaper.jpg",
  status: "Gamer",
  purchases: 21,
  desired: 15,
  contacts: <String>[
    'Steam',
    'Epic Games',
    'Discord',
    'Facebook',
    'VK',
  ],
  achievements: <Achievement>[
    Achievement(
      title: 'True Gamer',
      description: 'Buy 20 games',
      pathToIcon: 'assets/icons/achievements/controller.svg',
    ),
    Achievement(
      title: 'Sociable',
      description: 'Connect all contacts',
      pathToIcon: 'assets/icons/achievements/human-greeting-proximity.svg',
    ),
  ],
  favoriteGames: debugProductList,
  registrationDate: DateTime(2022, 4, 28, 18, 44),
  lastActivity: DateTime(2022, 7, 17, 23, 6),
);

final debugFilterGenre = [
  'Sandbox',
  'Strategy',
  'Shooters',
  'Simulation',
  'Puzzlers',
  'Survival',
  'Horror',
  'Adventure',
  'Platformer',
  'Battle Royale',
];

final debugFilterStylistics = [
  'Anime',
  'Cartoon',
  'Realistic',
  'Fantasy',
];

final debugFilterPlatforms = debugPlatformsList;

final debugFilterMultiplayer = [
  'Single-player',
  'Multi-player',
  'LAN',
  'Online',
  'PvP',
  'Co-op',
  'Shared/Split Screen',
  'Cross-Platform',
];
