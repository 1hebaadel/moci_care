import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobi_care/models/user_model.dart';
import 'package:mobi_care/modules/chat_details/chat_details_screen.dart';
import 'package:mobi_care/shared/styles/colors.dart';

import 'navigate_component.dart';

class DefaultButton extends StatelessWidget {
  late double width;
  late Color backgroundColor;
  late double redius;
  final Function() function;
  final String text;
  late double height;
  late double fontSize;

  DefaultButton({
    Key? key,
    double width = double.infinity,
    Color backgroundColor = Colors.teal,
    double redius = 0.0,
    required this.function,
    required this.text,
    double height = 52,
    double fontSize = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(redius),
      ),
      width: width,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(color: Colors.white, fontSize: fontSize),
        ),
      ),
    );
  }
}

class MedicationReminderContainer extends StatelessWidget {
  final String name;
  final String timeInHour;
  final String timeInMinute;
  final bool isTimeAM;
  final String howTimes;

  const MedicationReminderContainer({
    Key? key,
    required this.name,
    required this.timeInHour,
    required this.timeInMinute,
    required this.isTimeAM,
    required this.howTimes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: primaryColor1BA,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: primaryWhiteColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 21,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        timeInHour,
                        style: TextStyle(
                            color: primaryWhiteColor,
                            fontSize: 34,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        ':$timeInMinute',
                        style: TextStyle(
                          color: primaryWhiteColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      if (isTimeAM)
                        Text(
                          'AM',
                          style: TextStyle(
                            color: primaryWhiteColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      else
                        Text(
                          'PM',
                          style: TextStyle(
                            color: primaryWhiteColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                    ],
                  ),
                  Text(
                    howTimes,
                    style: TextStyle(
                      color: primaryWhiteColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DefaultImageShape extends StatelessWidget {
  final bool isMale;
  final String image;
  late double height;

  DefaultImageShape({
    Key? key,
    required this.isMale,
    required this.image,
    double height = 70,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isMale
        ? CircleAvatar(
      backgroundColor: primaryMaleColor,
      radius: height / 2 + 4,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: primaryMaleColor,
          shape: BoxShape.circle,
        ),
        clipBehavior: Clip.antiAlias,
        child: Image(
          image: NetworkImage(image),
          width: height,
          height: height,
          fit: BoxFit.cover,
        ),
      ),
    )
        : CircleAvatar(
      backgroundColor: primaryFemaleColor,
      radius: height / 2 + 4,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: primaryMaleColor,
          shape: BoxShape.circle,
        ),
        clipBehavior: Clip.antiAlias,
        child: Image(
          image: NetworkImage(image),
          width: height,
          height: height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class DefaultPostView extends StatelessWidget {
  final String publisherName;
  final String publisherImage;
  final String postText;
  final bool isImage;
  String? image;
  final bool isVideo;
  String? video;
  final bool isLiked;
  final String numberOfLikes;
  final String numberOfComments;
  final String dateOfPublish;

  DefaultPostView({
    Key? key,
    required this.publisherName,
    required this.publisherImage,
    required this.postText,
    required this.isImage,
    String? image,
    required this.isVideo,
    String? video,
    required this.isLiked,
    required this.numberOfLikes,
    required this.numberOfComments,
    required this.dateOfPublish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultImageShape(
                    isMale: false, image: publisherImage, height: 40),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    publisherName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                postText,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            if (isImage)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Image(
                  image: AssetImage('assets/image.png'),
                ),
              ),
            const Divider(),
            Row(
              children: [
                if (isLiked)
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      color: primaryLikeColor,
                    ),
                  ),
                if (!isLiked)
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      color: primaryLikeColor,
                    ),
                  ),
                Text(
                  '$numberOfLikes Likes',
                  style: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.comment_outlined,
                  ),
                ),
                Text(
                  '$numberOfComments comments',
                  style: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.w300),
                ),
                const Spacer(),
                Text(
                  dateOfPublish,
                  style: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DefaultChatRowUserViewItem extends StatelessWidget {
  final String lastMessage;
  final String dateOfLastMassage;
  final String numberOfMessage;
  final BuildContext context;
  final UserModel model;

  const DefaultChatRowUserViewItem({
    Key? key,
    required this.lastMessage,
    required this.dateOfLastMassage,
    required this.numberOfMessage,
    required this.context,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: InkWell(
        onTap: () {
          navigateTo(
            context: context,
            widget: ChatDetailsScreen(userModel: model),
          );
        },
        child: Row(
          children: [
            DefaultImageShape(
              isMale: model.isMale!,
              image: model.imageUrl!,
              height: 60,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${model.firstName} ${model.lastName}',
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      lastMessage,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
            // Spacer(),
            Column(
              children: [
                Text(
                  dateOfLastMassage,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w300,
                    color: primaryColor1BA,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: primaryColor1BA,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 4.0),
                    child: Text(
                      numberOfMessage,
                      style: TextStyle(
                          color: primaryWhiteColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DefaultSearchRowUserViewItem extends StatelessWidget {
  final bool isMale;
  final String image;
  final String name;
  final bool isDoctor;

  const DefaultSearchRowUserViewItem({
    Key? key,
    required this.isMale,
    required this.image,
    required this.name,
    required this.isDoctor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0),
      child: Row(
        children: [
          DefaultImageShape(
            isMale: isMale,
            image: image,
            height: 55,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(),
          if (isDoctor)
            Text(
              'Doctor',
              style: TextStyle(
                  fontSize: 18,
                  color: primaryGreyColor808,
                  fontWeight: FontWeight.w500),
            ),
          if (!isDoctor)
            Text(
              'Clinic',
              style: TextStyle(
                  fontSize: 18,
                  color: primaryGreyColor808,
                  fontWeight: FontWeight.w500),
            ),
        ],
      ),
    );
  }
}

class DefaultTextFormFieldWithoutBorder extends StatelessWidget {
  final TextEditingController controller;
  late double radius;

  DefaultTextFormFieldWithoutBorder({
    Key? key,
    required this.controller,
    double radius = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: primaryGreyColorD9D_50,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
        ),
      ),
    );
  }
}

class BuildPrescriptionItem extends StatelessWidget {
  final String dateTime;
  final String doctorName;

  const BuildPrescriptionItem({
    Key? key,
    required this.dateTime,
    required this.doctorName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: primaryWhiteColor,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color: primaryColor1BA.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 3,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: InkWell(
            onTap: () {},
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/pdf_icon.svg',
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  dateTime,
                  style: TextStyle(
                    color: primaryGreyColor808,
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: Text(
                    doctorName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: primaryBlueColor529,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DefaultSettingItem extends StatelessWidget {
  final IconData icon;
  final String labelName;
  final Widget widget;

  const DefaultSettingItem({
    Key? key,
    required this.icon,
    required this.labelName,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: primaryWhiteColor,
          boxShadow: [
            BoxShadow(
              color: primaryColor1BA.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
        child: Row(
          children: [
            Icon(
              icon,
              color: primaryBlackColor_60,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              labelName,
              style: TextStyle(
                fontSize: 16,
                color: primaryBlackColor_60,
              ),
            ),
            const Spacer(),
            widget,
          ],
        ),
      ),
    );
  }
}

class DefaultFollowUpWithItem extends StatelessWidget {
  final bool isMale;
  final String image;
  final String name;
  final String specialization;

  const DefaultFollowUpWithItem({
    Key? key,
    required this.isMale,
    required this.image,
    required this.name,
    required this.specialization,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding:
        const EdgeInsetsDirectional.only(start: 15.0, end: 15.0, top: 10.0),
        child: Row(
          children: [
            DefaultImageShape(
              isMale: isMale,
              image: image,
              height: 50,
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    specialization,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                  'assets/bottom_nav_icons/chat_not_active.svg'),
            ),
          ],
        ),
      ),
    );
  }
}

class DefaultSymptomItem extends StatelessWidget {
  final String nameOfSymptom;

  const DefaultSymptomItem({
    Key? key,
    required this.nameOfSymptom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 8.0, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            color: primaryColor1BA.withOpacity(0.3),
            borderRadius: BorderRadiusDirectional.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Text(
            nameOfSymptom,
            style: const TextStyle(
              // fontWeight: FontWeight.w300,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}

class BuildColumnTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelName;
  final String Function(String? value) validator;

  const BuildColumnTextField({
    Key? key,
    required this.controller,
    required this.labelName,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 12,
        ),
        Text(labelName),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: primaryWhiteColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}

class DefaultSymptomWithRemoveItem extends StatelessWidget {
  final String nameOfSymptom;

  const DefaultSymptomWithRemoveItem({
    Key? key,
    required this.nameOfSymptom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 8.0, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            color: primaryColor1BA.withOpacity(0.3),
            borderRadius: BorderRadiusDirectional.circular(25.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Stomach pain',
                style: TextStyle(
                  // fontWeight: FontWeight.w300,
                  fontSize: 13,
                ),
              ),
              SizedBox(
                width: 5.0,
              ),
              Icon(
                Icons.close,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DefaultCommentShape extends StatelessWidget {
  final String image;
  final String name;
  final bool isMale;
  final String textOfComment;

  const DefaultCommentShape({
    Key? key,
    required this.image,
    required this.name,
    required this.isMale,
    required this.textOfComment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: primaryGreyColorD9D_50,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultImageShape(isMale: isMale, height: 35, image: image),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      textOfComment,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
