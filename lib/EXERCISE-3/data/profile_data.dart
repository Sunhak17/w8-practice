import 'package:flutter/material.dart';

import '../model/profile_tile_model.dart';

ProfileData sunhakProfile = ProfileData(
  name: "Sunhak",
  position: "Software Engineering",
  avatarUrl: 'assets/profile.jpg',
  tiles: [
    TileData(icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
    TileData(icon: Icons.location_on, title: "Address", value: "Phnom Penh, Cambodia"),
    TileData(icon: Icons.email, title: "Mail", value: "sunhak.oeng@student.cadt.edu.kh"),
    TileData(icon: Icons.school, title: "Education", value: "Cambodia Academy of Digital Technology"),
    TileData(icon: Icons.language, title: "Language", value: "Khmer, English"),
  ],
);
