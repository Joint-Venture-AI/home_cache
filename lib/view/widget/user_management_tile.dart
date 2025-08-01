import 'package:flutter/material.dart';
import 'package:home_cache/constants/text_style.dart';

class UserManagementTile extends StatelessWidget {
  final String fullName;
  final String role;
  final VoidCallback? onTap;

  const UserManagementTile({
    super.key,
    required this.fullName,
    required this.role,
    this.onTap,
  });

  String getInitials(String name) {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    } else if (parts.isNotEmpty) {
      return parts[0].substring(0, 1).toUpperCase();
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.deepPurpleAccent,
        child: Text(
          getInitials(fullName),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      title: Text(fullName, style: TextStyles.semiBold),
      subtitle: Text(role, style: TextStyles.regular),
      onTap: onTap,
    );
  }
}
