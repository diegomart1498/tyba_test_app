import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:tyba_test/src/configs/ui_constants_config/ui/ui.dart';
import 'package:tyba_test/src/feature/details/package.dart';
import 'package:tyba_test/src/utilities/package.dart';

import '../../configs/host_config/host_environment.dart';
import '../../configs/url_launcher_config/url_launcher_service.dart';
import '../../shared/package.dart';

part 'models/pokemon_response_model.dart';
part 'provider/pokemon_provider.dart';
part 'repository/pokemon_repository.dart';
part 'state/pokemon_state.dart';
part 'views/home_page.dart';
part 'widgets/pokemon_image_card.dart';
