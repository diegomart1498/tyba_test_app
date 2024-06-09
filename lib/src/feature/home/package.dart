import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:tyba_test/src/configs/local_storage_config/package.dart';
import 'package:tyba_test/src/configs/text_style_config.dart/text_style_ext.dart';
import 'package:tyba_test/src/configs/ui_constants_config/package.dart';
import 'package:tyba_test/src/configs/ui_constants_config/ui/ui.dart';
import 'package:tyba_test/src/feature/details/package.dart';
import 'package:tyba_test/src/utilities/dialog/package.dart';
import 'package:tyba_test/src/utilities/package.dart';

import '../../configs/host_config/host_environment.dart';
import '../../configs/url_launcher_config/url_launcher_service.dart';
import '../../shared/package.dart';

part 'models/pokemon_abilties_model.dart';
part 'models/pokemon_response_model.dart';
part 'provider/pokemon_provider.dart';
part 'repository/pokemon_repository.dart';
part 'state/pokemon_state.dart';
part 'views/home_page.dart';
part 'widgets/ability_filter_button.dart';
part 'widgets/pokemon_ability_filter.dart';
part 'widgets/pokemon_ability_tile.dart';
part 'widgets/pokemon_image_card.dart';
