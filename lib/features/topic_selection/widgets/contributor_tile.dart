import 'package:flutter/material.dart';

class ContributorTile extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String job;
  final bool isFollowed;
  final VoidCallback onFollowTap;

  const ContributorTile({
    super.key,
    required this.avatarUrl,
    required this.name,
    required this.job,
    required this.isFollowed,
    required this.onFollowTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 28,
        backgroundImage: NetworkImage(avatarUrl),
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
      subtitle: Text(
        job,
        style: const TextStyle(color: Color(0xFF6D7E97), fontSize: 14),
      ),
      trailing: OutlinedButton(
        onPressed: onFollowTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: isFollowed ? const Color(0xFF3076E0) : Colors.transparent,
          side: BorderSide(
            color: isFollowed ? Colors.transparent : const Color(0xFF3076E0),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(
          isFollowed ? 'Following' : 'Follow',
          style: TextStyle(
            color: isFollowed ? Colors.white : const Color(0xFF3076E0),
          ),
        ),
      ),
      contentPadding: EdgeInsets.zero,
    );
  }
}