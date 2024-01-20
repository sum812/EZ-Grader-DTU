import 'package:ez_grader/src/constants/image_string.dart';
import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/constants/text_string.dart';
import 'package:ez_grader/src/features/core/models/appbar.dart';
import 'package:ez_grader/src/features/core/screens/guide/widgets/guide_step.dart';
import 'package:flutter/material.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: tGuideTitle),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: tGuidePadding * 2,
              horizontal: tGuidePadding),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              const GuideStep(
                  step: tGuideStep1,
                  detailStep: tGuideDetailStep1),
              const GuideStep(
                  step: tGuideStep2,
                  detailStep: tGuideDetailStep2),
              const GuideStep(
                  step: tGuideStep3,
                  detailStep: tGuideDetailStep3),
              const GuideStep(
                  step: tGuideStep4,
                  detailStep: tGuideDetailStep4),
              const GuideStep(
                  step: tGuideStep5,
                  detailStep: tGuideDetailStep5),
              const SizedBox(
                height: tGuidePadding,
              ),
              Text(
                tGuideErrorTitle,
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.copyWith(fontSize: 30),
              ),
              const SizedBox(height: tGuidePadding,),
              Text(tGuideErrorTitle1, style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 18),),
              const SizedBox(height: tGuidePadding,),
              Text(tGuideError1, style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 16),),
              const SizedBox(
                height: tGuidePadding,
              ),
              const Image(image: AssetImage(tGuideErrSBD1)),
              const Image(image: AssetImage(tGuideErrSBD2)),

              const SizedBox(
                height: tGuidePadding,
              ),
              Text(
                tGuideError2,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(fontSize: 16),
              ),
              const SizedBox(
                height: tGuidePadding,
              ),
              const Image(image: AssetImage(tGuideErrSbdMd1)),
              const Image(image: AssetImage(tGuideErrSbdMd2)),
              const Image(image: AssetImage(tGuideErrSbdMd3)),
              const Image(image: AssetImage(tGuideErrSbdMd4)),
              const Image(image: AssetImage(tGuideErrSbdMd5)),
              const Image(image: AssetImage(tGuideErrSbdMd6)),
              const Image(image: AssetImage(tGuideErrSbdMd7)),
              const Image(image: AssetImage(tGuideErrSbdMd8)),


              const SizedBox(
                height: tGuidePadding,
              ),
              Text(
                tGuideError3,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(fontSize: 16),
              ),
              const SizedBox(
                height: tGuidePadding,
              ),
              const Image(image: AssetImage(tGuideErrAns1)),
              const SizedBox(
                height: tGuidePadding,
              ),

              Text(
                tGuideError4,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(fontSize: 16),
              ),
              const SizedBox(
                height: tGuidePadding,
              ),
              const Image(image: AssetImage(tGuideErrAns2)),
              const SizedBox(
                height: tGuidePadding,
              ),

              Text(
                tGuideError5,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(fontSize: 16),
              ),
              const SizedBox(
                height: tGuidePadding,
              ),
              const Image(image: AssetImage(tGuideErrAns3)),

              const SizedBox(
                height: tGuidePadding,
              ),
              Text(
                tGuideTotal,
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(fontSize: 30),
              ),
              const SizedBox(
                height: tGuidePadding,
              ),
              Text(
                tGuideTotalDetail,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
