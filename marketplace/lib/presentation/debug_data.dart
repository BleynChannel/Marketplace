import 'package:flutter/material.dart';
import 'package:marketplace/domain/entity/contact.dart';
import 'package:marketplace/domain/entity/status.dart';
import 'package:marketplace/core/utils/utils.dart';
import 'package:marketplace/domain/entity/achievement.dart';
import 'package:marketplace/domain/entity/bundle.dart';
import 'package:marketplace/domain/entity/cart_product.dart';
import 'package:marketplace/domain/entity/desired.dart';
import 'package:marketplace/domain/entity/link.dart';
import 'package:marketplace/domain/entity/localization_product.dart';
import 'package:marketplace/domain/entity/notification.dart' as notification;
import 'package:marketplace/domain/entity/compact_product.dart';
import 'package:marketplace/domain/entity/platform.dart';
import 'package:marketplace/domain/entity/price.dart';
import 'package:marketplace/domain/entity/product.dart';
import 'package:marketplace/domain/entity/product_dlc.dart';
import 'package:marketplace/domain/entity/product_review.dart';
import 'package:marketplace/domain/entity/profile.dart';
import 'package:marketplace/domain/entity/system_requirement.dart';
import 'package:marketplace/domain/entity/user.dart';

//? Есть ли подключение к интернету?
const debugIsNetwork = true;

Future debugInit() async {
  debugCompactProductList = [
    CompactProduct(
      id: 'First',
      title: 'Cyberpunk 2077',
      banner: await Utils.getMediaImage(
          'assets/images/products/cyberpunk/preview_1.jpg'),
      price: const Price(
        price: 999,
        oldPrice: 1999,
        discount: 0.5,
      ),
      platforms: [
        Platform.windows,
        Platform.linux,
        Platform.macOS,
      ],
    ),
    CompactProduct(
      id: 'Second',
      title: 'Stray',
      banner: await Utils.getMediaImage(
          'assets/images/products/stray/preview_1.jpg'),
      price: const Price(
        price: 699,
        oldPrice: 0,
        discount: 0,
      ),
      platforms: [
        Platform.windows,
        Platform.linux,
        Platform.macOS,
        Platform.ps4,
        Platform.xboxOne,
        Platform.ps5,
      ],
    ),
    CompactProduct(
      id: 'Third',
      title: 'Minecraft',
      banner: await Utils.getMediaImage(
          'assets/images/products/minecraft/preview_1.jpg'),
      price: const Price(
        price: 1299,
        oldPrice: 2499,
        discount: 0.48,
      ),
      platforms: [
        Platform.windows,
        Platform.linux,
        Platform.macOS,
        Platform.android,
        Platform.ios,
        Platform.nintendoSwitch,
        Platform.ps4,
        Platform.xboxOne,
        Platform.ps5,
      ],
    ),
  ];

  debugProductList = [
    Product(
      id: 'First',
      title: debugCompactProductList[0].title,
      description:
          '''Deserunt consectetur eu non adipisicing eiusmod aliquip sint eiusmod. Ea eu cillum cillum reprehenderit fugiat nulla elit pariatur ex dolor culpa mollit occaecat cupidatat. Irure id qui exercitation voluptate. Adipisicing ad anim nostrud amet eu commodo ut dolore consequat labore. Voluptate cupidatat adipisicing Lorem amet adipisicing exercitation nisi laborum commodo nostrud do. Amet dolore dolore minim adipisicing qui Lorem non commodo labore.
Dolore Lorem non tempor irure eu in. Sunt in culpa laborum incididunt nisi. Eiusmod excepteur nostrud adipisicing pariatur sit laboris aute do voluptate voluptate qui proident. Aliquip nostrud anim proident id laboris consectetur. Sit voluptate nisi reprehenderit veniam velit. Deserunt elit reprehenderit enim labore officia dolore do. Nulla culpa commodo in in aliqua laboris reprehenderit.
Ullamco exercitation dolore ut occaecat ipsum ipsum do in incididunt veniam commodo. Duis incididunt deserunt labore in est sit ipsum in Lorem cupidatat. Ea aliquip deserunt ex culpa dolore et magna. Mollit elit consequat do occaecat pariatur non id aliqua ea ad officia quis. In consectetur consectetur elit ut anim ut velit excepteur.
Reprehenderit sint sunt laboris esse. Anim velit in incididunt tempor tempor id fugiat. Labore reprehenderit labore non anim et incididunt id aliquip. Est magna sit in deserunt nulla deserunt aliquip ex ipsum.''',
      icon: await Utils.getMediaImage(
          'assets/images/products/cyberpunk/icon.jpg'),
      media: [
        await Utils.getMediaVideo('https://youtube.com/watch?v=qIcTM8WXFjk'),
        await Utils.getMediaImage(
            'assets/images/products/cyberpunk/preview_1.jpg'),
        await Utils.getMediaImage(
            'assets/images/products/cyberpunk/preview_2.jpg'),
        await Utils.getMediaImage(
            'assets/images/products/cyberpunk/preview_3.jpg'),
        await Utils.getMediaImage(
            'assets/images/products/cyberpunk/preview_4.jpg'),
      ],
      price: debugCompactProductList[0].price,
      rating: 4.8,
      countBuy: 654865,
      genre: [
        'Shooters',
        'Adventure',
      ],
      stylistics: [
        'Realistic',
      ],
      platforms: debugCompactProductList[0].platforms,
      multiplayer: [
        'Single-player',
      ],
      localization: [
        const LocalizationProduct(
          language: 'English',
          enabledSound: true,
          enabledInterface: true,
          enabledSubtitles: true,
        ),
        const LocalizationProduct(
          language: 'Russian',
          enabledSound: true,
          enabledInterface: true,
          enabledSubtitles: true,
        ),
        const LocalizationProduct(
          language: 'French',
          enabledSound: true,
          enabledInterface: true,
          enabledSubtitles: true,
        ),
        const LocalizationProduct(
          language: 'German',
          enabledSound: true,
          enabledInterface: true,
          enabledSubtitles: true,
        ),
        const LocalizationProduct(
          language: 'Arabic',
          enabledSound: false,
          enabledInterface: true,
          enabledSubtitles: true,
        ),
        const LocalizationProduct(
          language: 'Czech',
          enabledSound: false,
          enabledInterface: true,
          enabledSubtitles: true,
        ),
      ],
      developer: 'CD PROJEKT RED',
      publisher: 'CD PROJEKT RED',
      releaseDate: DateTime(2020, 12, 10),
      links: const [
        Link(
          title: 'Visit to Website',
          url: 'https://cyberpunk.net',
        ),
        Link(
          title: 'Visit to Facebook',
          url: 'https://facebook.com/CyberpunkGame/',
        ),
      ],
      productDlc: [
        const ProductDLC(
          title: 'Cyberpunk 2077 Bonus Content',
          price: Price(price: 0, oldPrice: 0, discount: 0),
        ),
        const ProductDLC(
          title: 'Cyberpunk 2077 REDmod',
          price: Price(price: 0, oldPrice: 0, discount: 0),
        ),
      ],
      bundles: [
        Bundle(
          title: 'Cyberpunk style',
          price: const Price(price: 999, oldPrice: 2699, discount: 0.63),
          products: [
            debugCompactProductList[0],
            debugCompactProductList[1],
          ],
        ),
      ],
      systemRequirement: [
        const SystemRequirement(
          type: SystemRequirementType.minimum,
          platform: Platform.windows,
          params: [
            'OS: Windows 10',
            'Processor: Intel Core i5-3570K or AMD FX-8310',
            'RAM: 8 GB',
            'Graphics: NVIDIA GeForce GTX 970 or AMD Radeon RX 470',
            'Storage: 70 GB',
          ],
        ),
        const SystemRequirement(
          type: SystemRequirementType.recommended,
          platform: Platform.windows,
          params: [
            'OS: Windows 10',
            'Processor: Intel Core i7-4790K or AMD Ryzen 3 3200G',
            'RAM: 12 GB',
            'Graphics: NVIDIA GeForce GTX 1060 6GB or AMD Radeon RX 590',
            'Storage: 70 GB',
          ],
        ),
      ],
      productReview: [
        ProductReview(
          user: User(
            id: '2',
            nickname: 'Jurian John',
            avatar: await Utils.getMediaImage('assets/images/avatars/2.png'),
          ),
          rating: 4.6,
          description:
              '''Consequat est irure in occaecat sunt labore adipisicing cillum incididunt esse elit qui nostrud dolore.
Non non magna nisi irure exercitation aliquip minim exercitation eiusmod veniam voluptate consectetur voluptate.''',
        ),
        ProductReview(
          user: User(
            id: '3',
            nickname: 'Elo Jennifer',
            avatar: await Utils.getMediaImage('assets/images/avatars/3.png'),
          ),
          rating: 4.6,
          description:
              '''Deserunt enim laborum labore aliqua aliqua. Irure cupidatat anim ut eiusmod. Deserunt anim excepteur irure ipsum minim id labore nostrud sint. Magna sunt occaecat officia eiusmod laboris id anim enim nisi et enim sit nostrud. Ut ea voluptate in ut.
Labore exercitation cupidatat est eiusmod proident. Quis ullamco non ea nisi consectetur et consequat commodo ad labore. Eiusmod quis dolore elit dolore Lorem ullamco aute. Eu sit amet fugiat ex. Voluptate mollit officia do dolor. Lorem pariatur ipsum duis commodo.''',
        ),
      ],
    ),
    Product(
      id: 'Second',
      title: debugCompactProductList[1].title,
      description:
          '''Id cillum excepteur officia incididunt velit ex minim reprehenderit nulla. Pariatur irure sunt fugiat laborum. Consequat cupidatat commodo non nulla incididunt dolor exercitation quis nulla adipisicing occaecat voluptate ullamco. Enim dolore aute tempor irure Lorem fugiat dolor pariatur consectetur do. Id sunt deserunt qui ut.
Culpa mollit elit dolor labore laborum reprehenderit veniam eu duis duis elit do eiusmod officia. Deserunt laborum voluptate consequat ea laboris duis in. Aliquip nulla nostrud aute mollit nulla occaecat exercitation ad dolore tempor dolore sint et. Commodo consequat laboris reprehenderit aute sunt dolore nostrud consequat sit incididunt. Cupidatat labore fugiat tempor adipisicing esse qui sunt velit nulla tempor cupidatat culpa.''',
      icon: await Utils.getMediaImage('assets/images/products/stray/icon.jpg'),
      media: [
        await Utils.getMediaVideo('https://youtube.com/watch?v=u84hRUQlaio'),
        await Utils.getMediaImage('assets/images/products/stray/preview_1.jpg'),
      ],
      price: debugCompactProductList[1].price,
      rating: 4.6,
      countBuy: 436564,
      genre: [
        'Simulation',
        'Puzzlers',
        'Adventure',
        'Platformer',
      ],
      stylistics: [
        'Realistic',
      ],
      platforms: debugCompactProductList[1].platforms,
      multiplayer: ['Single-player'],
      localization: [],
      developer: '',
      publisher: '',
      releaseDate: DateTime.now(),
      links: [],
      productDlc: [],
      bundles: [],
      systemRequirement: [],
      productReview: [],
    ),
    Product(
      id: 'Third',
      title: debugCompactProductList[2].title,
      description:
          '''Labore ex voluptate amet occaecat non nostrud magna cupidatat. Irure deserunt ad amet ullamco reprehenderit eu reprehenderit do. Excepteur eu duis velit deserunt qui commodo aliqua et pariatur quis dolore. Cupidatat aliqua fugiat veniam incididunt duis sit magna mollit quis anim officia. Sit in occaecat laborum Lorem tempor voluptate nisi do enim aliquip amet incididunt minim. Excepteur ipsum non proident amet deserunt incididunt reprehenderit esse aute adipisicing magna consequat. Mollit sit do qui minim aliqua nisi qui eu.
Ut eu amet mollit aliqua non sit aute. Ea laborum magna nisi et qui. Dolore adipisicing ea commodo sit laboris veniam esse excepteur id voluptate ullamco exercitation consectetur magna. Aliquip deserunt minim reprehenderit officia eiusmod labore ut consequat veniam. Occaecat ut fugiat irure ad amet adipisicing id officia minim laboris ullamco. Reprehenderit ex pariatur duis laboris do anim eu.''',
      icon: await Utils.getMediaImage(
          'assets/images/products/minecraft/icon.png'),
      media: [
        await Utils.getMediaVideo('https://youtube.com/watch?v=MmB9b5njVbA'),
        await Utils.getMediaVideo('https://youtube.com/watch?v=jMe3tdyjouM'),
        await Utils.getMediaImage(
            'assets/images/products/minecraft/preview_1.jpg'),
      ],
      price: debugCompactProductList[2].price,
      rating: 4.9,
      countBuy: 5433556,
      genre: [
        'Sandbox',
        'Simulation',
        'Survival',
        'Adventure',
      ],
      stylistics: [
        'Fantasy',
      ],
      platforms: debugCompactProductList[2].platforms,
      multiplayer: [
        'Single-player',
        'Multi-player',
        'LAN',
        'Online',
        'PvP',
        'Co-op',
        'Cross-Platform',
      ],
      localization: [],
      developer: '',
      publisher: '',
      releaseDate: DateTime.now(),
      links: [],
      productDlc: [],
      bundles: [],
      systemRequirement: [],
      productReview: [],
    ),
  ];

  debugCartProductList = [
    CartProduct(
      product: debugCompactProductList[0],
      count: 1,
    ),
    CartProduct(
      product: debugCompactProductList[1],
      count: 1,
    ),
    CartProduct(
      product: debugCompactProductList[2],
      count: 1,
    ),
  ];

  debugDesiredList = [
    Desired(product: debugCompactProductList[0]),
    Desired(product: debugCompactProductList[1]),
    Desired(product: debugCompactProductList[2]),
  ];

  debugNotification = [
    notification.Notification(
      title: "Autumn discounts",
      banner: await Utils.getMediaImage(
          'assets/images/notification_discount_image.jpg'),
      description: 'Get a 50% discount on the purchase of mobile games.',
    ),
  ];

  debugProfile = Profile(
    id: '1',
    nickname: "Adam Harris",
    avatar: await Utils.getMediaImage('assets/images/avatars/1.png'),
    backgroundImage:
        await Utils.getMediaImage('assets/images/profile_wallpaper.jpg'),
    status: const Status(title: 'Gamer', color: Colors.lightGreen),
    purchases: 21,
    desired: 15,
    contacts: [
      Contact(
        name: 'Steam',
        icon:
            await Utils.getMediaImage(Utils.contactsToPathToSvgIcons('Steam')),
        url: 'https://steamcommunity.com/profiles/76561198305869342/',
      ),
      Contact(
        name: 'Epic Games',
        icon: await Utils.getMediaImage(
            Utils.contactsToPathToSvgIcons('Epic Games')),
        url: 'https://store.epicgames.com/',
      ),
      Contact(
        name: 'Discord',
        icon: await Utils.getMediaImage(
            Utils.contactsToPathToSvgIcons('Discord')),
        url: 'https://discord.com/',
      ),
    ],
    achievements: [
      Achievement(
        title: 'True Gamer',
        description: 'Buy 20 games',
        icon: await Utils.getMediaImage(
            'assets/icons/achievements/controller.svg'),
      ),
      Achievement(
        title: 'Sociable',
        description: 'Connect all contacts',
        icon: await Utils.getMediaImage(
            'assets/icons/achievements/human-greeting-proximity.svg'),
      ),
    ],
    favoriteGames: debugCompactProductList,
    registrationDate: DateTime(2022, 4, 28, 18, 44),
    lastActivity: DateTime(2022, 7, 17, 23, 6),
  );

  debugFilterGenre = [
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

  debugFilterStylistics = [
    'Anime',
    'Cartoon',
    'Realistic',
    'Fantasy',
  ];

  debugFilterMultiplayer = [
    'Single-player',
    'Multi-player',
    'LAN',
    'Online',
    'PvP',
    'Co-op',
    'Shared/Split Screen',
    'Cross-Platform',
  ];
}

late List<CompactProduct> debugCompactProductList;

late List<Product> debugProductList;

late List<CartProduct> debugCartProductList;

late List<Desired> debugDesiredList;

late List<notification.Notification> debugNotification;

late Profile debugProfile;

late List<String> debugFilterGenre;

late List<String> debugFilterStylistics;

late List<String> debugFilterMultiplayer;
