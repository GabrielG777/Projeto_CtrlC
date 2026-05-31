import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text(
          'Perfil',
          style: TextStyle(
            color: AppColors.text,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: AppColors.text,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [

            // FOTO
            CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.primary,
              child: const Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'João Silva',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.text,
              ),
            ),

            const SizedBox(height: 4),

            const Text(
              'joao@email.com',
              style: TextStyle(
                color: AppColors.subtitle,
              ),
            ),

            const SizedBox(height: 40),

            _buildOptionTile(
              icon: Icons.edit_outlined,
              title: 'Editar Perfil',
              onTap: () {},
            ),

            _buildOptionTile(
              icon: Icons.lock_outline,
              title: 'Alterar Senha',
              onTap: () {},
            ),

            _buildOptionTile(
              icon: Icons.notifications_none,
              title: 'Notificações',
              onTap: () {},
            ),

            _buildOptionTile(
              icon: Icons.info_outline,
              title: 'Sobre o App',
              onTap: () {},
            ),

            _buildOptionTile(
              icon: Icons.logout,
              title: 'Sair',
              onTap: () {},
              isLogout: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [

                Icon(
                  icon,
                  color: isLogout
                      ? Colors.red
                      : AppColors.primary,
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: isLogout
                          ? Colors.red
                          : AppColors.text,
                    ),
                  ),
                ),

                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}