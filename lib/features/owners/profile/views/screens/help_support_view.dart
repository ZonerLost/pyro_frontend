import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/features/owners/profile/controller/support_controller.dart';
import 'package:pyroapp/features/owners/profile/views/screens/chat_support_view.dart';
import '../widgets/app_scaffold.dart';

class HelpSupportView extends StatelessWidget {
  const HelpSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: AppStrings.helpAndSupport,
      child: GetBuilder<SupportController>(
        init: SupportController(),
        builder: (controller) => Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(AppDimensions.paddingMedium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: AppDimensions.height10),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radius12,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.shadow,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Theme(
                        data: Theme.of(
                          context,
                        ).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: Text(
                            "What is Pyro?",
                            style: TextStyle(
                              fontSize: AppDimensions.font14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.maincolor3,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.add,
                            color: AppColors.black,
                          ),
                          childrenPadding: EdgeInsets.fromLTRB(
                            AppDimensions.paddingMedium,
                            0,
                            AppDimensions.paddingMedium,
                            AppDimensions.paddingMedium,
                          ),
                          children: [
                            Divider(color: AppColors.grey.withOpacity(0.3)),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                              style: TextStyle(
                                fontSize: AppDimensions.font12,
                                color: AppColors.maincolor3,
                                height: 1.45,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: controller.faqs.map((f) {
                        return Container(
                          margin: EdgeInsets.only(
                            bottom: AppDimensions.height10,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radius12,
                            ),
                            border: Border.all(color: AppColors.border),
                            boxShadow: const [
                              BoxShadow(
                                color: AppColors.shadow,
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Theme(
                            data: Theme.of(
                              context,
                            ).copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              title: Text(
                                f.question,
                                style: TextStyle(
                                  fontSize: AppDimensions.font14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.maincolor3,
                                ),
                              ),
                              trailing: const Icon(
                                Icons.add,
                                color: AppColors.black,
                              ),
                              childrenPadding: EdgeInsets.fromLTRB(
                                AppDimensions.paddingMedium,
                                0,
                                AppDimensions.paddingMedium,
                                AppDimensions.paddingMedium,
                              ),
                              children: [
                                Text(
                                  f.answer,
                                  style: TextStyle(
                                    fontSize: AppDimensions.font12,
                                    color: AppColors.maincolor3,
                                    height: 1.45,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(AppDimensions.paddingMedium),
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () => Get.to(() => const ChatSupportView()),
                  child: CircleAvatar(
                    radius: AppDimensions.radius16 * 1.7,
                    backgroundColor: AppColors.primary,
                    child: Image.asset(
                      ImageStrings.messagesIcon,
                      height: AppDimensions.height40,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
