class Restaurant {
  final String? name;
  final String? address;
  final String? phone;
  final String? picture;

  const Restaurant(this.name, this.address, this.phone, this.picture);
}

final List<Restaurant> restaurants = _restaurants
    .map((e) => Restaurant(e["name"], e["address"], e["phone"], e["picture"]))
    .toList(growable: false);

final List<Map<String, String>> _restaurants = [
  {
    "_id": "a1",
    "name": "엣날 농장",
    "address": "Gwanghui-ro 222",
    "phone": "02-123-1111",
    "picture":
        "https://postfiles.pstatic.net/MjAyMDAxMDdfNDIg/MDAxNTc4MzYyMzgyMTA1.MJOZj6y3DIDFVKC5YuFfWaX3zyX2hX0KO7bfn28MA9Mg.ZSPXQcXU43bnoiGbkRwcxHQNtoy7cBZ597TZnnmdRMIg.JPEG.jjubu0691/SE-71024ca1-c0ca-4e1b-9360-cc75ae535c78.jpg?type=w966"
  },
  {
    "_id": "a2",
    "name": "로얄돈가스",
    "address": "Gwanghui-ro 222",
    "phone": "02-123-1111",
    "picture":
        "https://postfiles.pstatic.net/MjAyMTEwMjBfOTUg/MDAxNjM0NzM3MzgxMjcw.PKhZZ72elrrKGcleogvrj5qxfLUu7OLLQ70wLaVRIjwg.ZzHELGBvJR6O1c4BlGo_d2xP5JEH3BnuvKB5f9f5EOAg.JPEG.joohj9404/output_2706785171.jpg?type=w773"
  },
];
