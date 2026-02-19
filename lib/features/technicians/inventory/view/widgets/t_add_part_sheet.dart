import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import '../../controller/t_inventory_controller.dart';
import 't_upload_tile.dart';
import 't_confirm_button.dart';

class TAddPartSheet extends StatelessWidget {
  final TInventoryController controller;

  const TAddPartSheet({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.paddingMedium),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(
              bottom: bottomInset > 0
                  ? bottomInset
                  : AppDimensions.paddingMedium,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppDimensions.height10),

                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back, color: AppColors.black),
                      SizedBox(width: AppDimensions.width10),
                      Text(
                        "Back",
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: AppDimensions.height20),

                Text(
                  "Add Part to Inventory",
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.black,
                    fontSize: AppDimensions.font20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: AppDimensions.height5),
                Text(
                  "Please add the below information to add new device.",
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontSize: AppDimensions.font14,
                    color: AppColors.maincolor3,
                  ),
                ),

                SizedBox(height: AppDimensions.height15),
                Divider(color: AppColors.grey.withOpacity(0.22), height: 1),
                SizedBox(height: AppDimensions.height15),

                TUploadTile(
                  title: "Upload Product Image",
                  subtitle: "File size (100 mb max)",
                  onUpload: () {},
                ),

                SizedBox(height: AppDimensions.height15),
                Divider(color: AppColors.grey.withOpacity(0.22), height: 1),
                SizedBox(height: AppDimensions.height15),

                Container(
                  padding: EdgeInsets.all(AppDimensions.paddingMedium),
                  decoration: BoxDecoration(
                    color: AppColors.maincolor4,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.maincolor3,
                        ),
                      ),
                      TextField(
                        controller: controller.nameController,
                        textInputAction: TextInputAction.done,
                        onSubmitted: (_) => controller.confirmAddPart(),
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: AppDimensions.height20),

                TConfirmButton(
                  title: "Confirm",
                  onTap: controller.confirmAddPart,
                ),

                SizedBox(height: AppDimensions.height10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
