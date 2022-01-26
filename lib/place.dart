class TravelPlace {
  TravelPlace({
    required this.name,
    required this.user,
    required this.imageUrl,
    this.id = '',
    this.description = '',
    this.locationDesc = '',
    this.statusTag = StatusTag.popular,
    this.shared = 0,
    this.likes = 0,
  });

  final String id;
  final String name;
  final TravelUser user;
  final StatusTag statusTag;
  final int shared;
  final int likes;
  final String locationDesc;
  final String description;
  final List<String> imageUrl;

  static final places = [
    TravelPlace(
      id: '1',
      name: 'Nairobi Park',
      likes: 500,
      shared: 200,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Augue interdum velit euismod in pellentesque massa placerat duis. In fermentum et sollicitudin ac orci. Natoque penatibus et magnis dis parturient. Tincidunt eget nullam non nisi est sit amet facilisis. Venenatis a condimentum vitae sapien pellentesque habitant morbi tristique.',
      imageUrl: [
        'https://www.tripsavvy.com/thmb/4HYwAUtav5MuGpOttgUgmftrDB8=/2121x1193/smart/filters:no_upscale()/GettyImages-707552273-55f522193bcf4f0b876496f52652cb36.jpg',
        'https://www.traveller.com.au/content/dam/images/g/j/l/c/w/i/image.related.articleLeadwide.620x349.h0wbrz.png/1519102537715.jpg',
        'https://media.cntraveler.com/photos/61255f9a792563ad9f96730e/1:1/w_3594,h_3594,c_limit/Nairobi,%20Kenya_GettyImages-517003864.jpg',
      ],
      statusTag: StatusTag.popular,
      user: TravelUser.kymoraa,
      locationDesc: 'Nairobi, Nairobi County',
    ),
    TravelPlace(
      id: '2',
      name: 'Diani Beach',
      likes: 149,
      shared: 52,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Augue interdum velit euismod in pellentesque massa placerat duis. In fermentum et sollicitudin ac orci. Natoque penatibus et magnis dis parturient. Tincidunt eget nullam non nisi est sit amet facilisis. Venenatis a condimentum vitae sapien pellentesque habitant morbi tristique.',
      imageUrl: [
        'https://brilliant-africa.imgix.net/Diani-Beach-Diani-Sea-Lodge-1.jpg',
        'https://wallpaperaccess.com/full/6552503.jpg',
        'https://www.basecampexplorer.com/wp-content/uploads/2017/07/diani_beach_waterlovers_10-600x402.jpg',
      ],
      statusTag: StatusTag.event,
      user: TravelUser.rihanna,
      locationDesc: 'Diani, Kwale County',
    ),
    TravelPlace(
      id: '3',
      name: 'Nanyuki',
      likes: 11,
      shared: 43,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Augue interdum velit euismod in pellentesque massa placerat duis. In fermentum et sollicitudin ac orci. Natoque penatibus et magnis dis parturient. Tincidunt eget nullam non nisi est sit amet facilisis. Venenatis a condimentum vitae sapien pellentesque habitant morbi tristique.',
      imageUrl: [
        'http://www.animalorphanagekenya.org/site/wp-content/uploads/bongo-mt-kenya-cover.jpg',
        'https://www.fairmont.com/assets/0/104/2253/2258/4760/4768/451eeb59-1918-46e3-89d2-391d50493413.jpg',
        'https://i2.wp.com/kenyayote.com/wp-content/uploads/2015/11/thompson-falls-in-nanyuki.jpg',
      ],
      statusTag: StatusTag.event,
      user: TravelUser.holland,
      locationDesc: 'Nanyuki, Laikipia County',
    ),
    TravelPlace(
      id: '4',
      name: 'Kisumu',
      likes: 250,
      shared: 117,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Augue interdum velit euismod in pellentesque massa placerat duis. In fermentum et sollicitudin ac orci. Natoque penatibus et magnis dis parturient. Tincidunt eget nullam non nisi est sit amet facilisis. Venenatis a condimentum vitae sapien pellentesque habitant morbi tristique.',
      imageUrl: [
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Kisumu%2C_Kenya.jpg/360px-Kisumu%2C_Kenya.jpg',
        'https://www.southriftgalaxysafaris.com/blog/wp-content/uploads/2018/09/Kit-Mikayi-2-5.jpg',
        'https://www.rusinga.com/images/gallery/41.jpg',
      ],
      statusTag: StatusTag.event,
      user: TravelUser.zendeya,
      locationDesc: 'Kisumu, Kisumu County',
    ),
  ];
}

class TravelUser {
  TravelUser(this.name, this.urlPhoto);

  final String name;
  final String urlPhoto;

  static TravelUser kymoraa = TravelUser('Jackie Moraa', 'https://pbs.twimg.com/profile_images/1015701155001851904/VzvRfVmd_400x400.jpg');
  static TravelUser zendeya = TravelUser('Zendeya Coleman ', 'https://static.wikia.nocookie.net/marvelmovies/images/4/45/Zendaya_Coleman.jpg');
  static TravelUser rihanna = TravelUser('Rihanna Fenty', 'https://imagevars.gulfnews.com/2019/07/21/Rihanna_16c147b2846_medium.jpg');
  static TravelUser holland = TravelUser('Tom Holland', 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/elm030119cetomhollandnature-001-1561051667.jpg');

  static List<TravelUser> users = [kymoraa, zendeya, rihanna, holland];
}



enum StatusTag { popular, event }
