import 'package:dartz/dartz.dart';
import 'package:ploff_kebab/core/error/failure.dart';
import 'package:ploff_kebab/core/usecase/usecase.dart';
import 'package:ploff_kebab/features/home/domain/entities/banner_entity/banner_entity.dart';
import 'package:ploff_kebab/features/home/domain/repository/home_repository.dart';


class GetBannerUseCase extends UseCase<BannerEntity, NoParams> {
  final HomeRepository repository;

  GetBannerUseCase({required this.repository});

  @override
  Future<Either<Failure, BannerEntity>> call(NoParams params) async {
    final response = await repository.getBanners();
    return response;
  }
}
