
class Profile {

  String name;
  String imagePath;
  String country;
  String city;
  int followers;
  int posts;
  int following;
  bool isFollow;

  Profile({
    this.name,
    this.imagePath,
    this.country,
    this.city,
    this.followers,
    this.posts,
    this.following,
    this.isFollow
  });


}


final List<Profile> profiles = [
  Profile(
    imagePath: 'images/image1.jpg',
    name: 'Keira Knatrlo',
    city: 'paris',
    country: 'France',
    followers: 165,
    following: 22,
    posts: 197,
    isFollow: false
  ),
  Profile(
    imagePath: 'images/image2.jpg',
    name: 'Sandra palmer',
    city: 'barcelona',
    country: 'Spain',
    followers: 789,
    following: 182,
    posts: 857,
    isFollow: false
  ),
  Profile(
    imagePath: 'images/image3.jpg',
    name: 'Jennifer mortez',
    city: 'Italy',
    country: 'rome',
    followers: 55,
    following: 850,
    posts: 6550,
    isFollow: false
  ),
];