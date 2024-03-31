import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UploadService {
  final String apiKey = dotenv.env['CLOUDINARY_API_KEY'] ?? '';
  final String apiSecret = dotenv.env['CLOUDINARY_API_SECRET'] ?? '';
  final String cloudName = dotenv.env['CLOUDINARY_CLOUD_NAME'] ?? '';
  final String folder = dotenv.env['UPLOAD_FOLDER'] ?? '';
  final String uploadPreset = 'kw3fnskc';
  late Cloudinary cloudinary;

  UploadService() {
    cloudinary = Cloudinary.unsignedConfig(
      cloudName: cloudName,
    );
  }

  Future<CloudinaryResponse> upload(File data, List<int> fileBytes,
      Function(int, int) progressCallback) async {
    return await cloudinary.unsignedUpload(
      file: data.path,
      fileBytes: fileBytes,
      resourceType: CloudinaryResourceType.image,
      folder: folder,
      progressCallback: progressCallback,
      uploadPreset: uploadPreset
    );
  }
}
