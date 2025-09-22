// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class Response extends StatefulWidget {
  const Response({
    super.key,
    this.width,
    this.height,
    this.input,
    this.onReportAction,
  });

  final double? width;
  final double? height;
  final String? input;
  final Future<dynamic> Function()? onReportAction;

  @override
  State<Response> createState() => _ResponseState();
}

class _ResponseState extends State<Response> {
  bool _isSourcesExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    final String inputText = widget.input ?? '';

    final String sourcesText = '''
**Karan's CGM Data:**
* Glucose spikes measured with the Sibionics GS3 continuous glucose monitor
* Spike = difference between fasting and post-meal peak (45–90 min window)
* 200+ foods tested in isolation and real-world combinations
* See test protocol & database: [https://sweetdatabase.softr.app](https://sweetdatabase.softr.app)

**Sources – Smarter Carbs:**
* Cooling white rice increases resistant starch: Asia Pac J Clin Nutr. 2015. [Source](https://pubmed.ncbi.nlm.nih.gov/26693746/)
* Whole grain vs refined grain glucose response: Am J Clin Nutr. 2018. [Source](https://pubmed.ncbi.nlm.nih.gov/30321274/)
* Non-nutritive sweeteners & glycemic response: Nutrients. 2023. [Source](https://doi.org/10.3390/nu15041050)

**Sources – Protein Addition:**
* Meta-analysis of protein + carb meals: J Nutr. 2024. [Source](https://pubmed.ncbi.nlm.nih.gov/39019167/)
* Protein-rich meal provides beneficial glycemic responses: Front. Nutr., 04 July 2024 [Source](https://www.frontiersin.org/journals/nutrition/articles/10.3389/fnut.2024.1395745/full)

**Sources – Fiber Booster:**
* Dietary fiber & glucose in healthy adults: Mediscope. 2018. [Source](https://doi.org/10.3329/mediscope.v6i1.38940)
* Fiber improves glucose in diabetes: NEJM. 2000. [Source](https://www.nejm.org/doi/full/10.1056/NEJM200005113421903)

**Sources – Portion Control:**
* Portion size & satiety: Obesity (Silver Spring). 2010. [Source](https://pubmed.ncbi.nlm.nih.gov/19629055/)
* Protein/veg before carbs flattens spikes: Shukla et al. [Source](https://pubmed.ncbi.nlm.nih.gov/30101510/)

**Sources – Apple Cider Vinegar (ACV)**
* ACV may modestly improve insulin sensitivity: Johnston et al., Diabetes Care. 2004. [Source](https://pubmed.ncbi.nlm.nih.gov/14694010/)

**Sources – Walking After Meals**
* Light walking post-meal reduces glucose rise: Nutrients. 2022 – Postprandial walking study. [Source](https://doi.org/10.3390/nu14051080)

Complete sources: [https://sweetreactions.ai/citations](https://sweetreactions.ai/citations)

---

⚠️ **This is not medical advice. Please consult a healthcare provider before making health decisions.**
''';

    final String disclaimerText =
        'This is not medical advice. Consult your healthcare provider before making health decisions.';

    void launchURL(String? url) async {
      if (url != null && await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      }
    }

    Widget buildCollapsed() {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: theme.primary,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.source_outlined, color: Colors.white, size: 16),
            SizedBox(width: 6),
            Text('Sources',
                style: theme.bodyMedium.copyWith(color: Colors.white)),
          ],
        ),
      );
    }

    Widget buildExpandedHeader() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.source_outlined, color: theme.primary, size: 18),
              SizedBox(width: 8),
              Text('Sources & Methodology', style: theme.bodyLarge),
            ],
          ),
          Icon(Icons.keyboard_arrow_up_rounded,
              color: theme.secondaryText, size: 24),
        ],
      );
    }

    return Container(
      width: widget.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () =>
                      setState(() => _isSourcesExpanded = !_isSourcesExpanded),
                  child: AnimatedCrossFade(
                    firstChild: buildCollapsed(),
                    secondChild: buildExpandedHeader(),
                    crossFadeState: _isSourcesExpanded
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 300),
                    alignment: Alignment.centerLeft,
                  ),
                ),
              ),
              SizedBox(width: 8),
              IconButton(
                icon: Icon(Icons.flag_outlined,
                    size: 20, color: theme.secondaryText),
                onPressed: () {
                  if (widget.onReportAction != null) {
                    widget.onReportAction!();
                  }
                },
                tooltip: 'Report content',
              ),
            ],
          ),
          if (_isSourcesExpanded)
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 8.0),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: theme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: MarkdownBody(
                data: sourcesText,
                selectable: true,
                onTapLink: (text, href, title) => launchURL(href),
                styleSheet:
                    MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                  p: theme.bodySmall.copyWith(color: theme.secondaryText),
                  listBullet:
                      theme.bodySmall.copyWith(color: theme.secondaryText),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: MarkdownBody(
              data: inputText,
              selectable: true,
              onTapLink: (text, href, title) => launchURL(href),
              styleSheet:
                  MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                p: theme.bodyMedium,
                h3: theme.headlineSmall.override(
                  fontFamily: theme.headlineSmallFamily,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts: true,
                ),
                strong: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              disclaimerText,
              style: theme.bodySmall.override(
                fontFamily: theme.bodySmallFamily,
                color: theme.secondaryText,
                useGoogleFonts: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
