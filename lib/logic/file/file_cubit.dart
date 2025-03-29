import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_cubit.freezed.dart';
part 'file_state.dart';

class FileModel {
  final String fileName;
  final Uint8List fileData;
  final String url;

  FileModel({
    required this.fileName,
    required this.fileData,
    required this.url,
  });

  Map<String, dynamic> toJson() {
    return {
      "fileName": fileName,
      "fileData": base64Encode(fileData),
      "url": url,
    };
  }

  Future<MultipartFile> toMultipartFile() async {
    return MultipartFile.fromBytes(fileData, filename: fileName);
  }
}

class FileLoadingState {
  final bool loading;
  final num progress;

  FileLoadingState(this.loading, this.progress);
}

class FileLoadingCubit extends Cubit<FileLoadingState> {
  FileLoadingCubit() : super(FileLoadingState(false, 0.0));

  void startLoading() => emit(FileLoadingState(true, 0.0));

  void updateProgress(num progress) => emit(FileLoadingState(true, progress));

  void stopLoading() => emit(FileLoadingState(false, 0.0));
}

class FileCubit extends Cubit<FileState> {
  FileCubit() : super(const FileState.initial());

  void addFile(String key, String fileName, Uint8List data,
      {List<String> allowedExtensions = const ['*'], required String url}) {
    final files = state.maybeWhen(
      loaded: (files) => files,
      orElse: () => <String, FileModel>{},
    );
    emit(const FileState.loading());
    final newFiles = {...files, key: FileModel(fileName: fileName, fileData: data, url: url)};
    emit(FileState.loaded(newFiles));
  }

  void removeFile(String key) {
    final files = state.maybeWhen(
      loaded: (files) => files,
      orElse: () => <String, FileModel>{},
    );
    emit(const FileState.loading());

    final newFiles = {...files};
    newFiles.remove(key);
    emit(FileState.loaded(newFiles));
  }

  void clearFiles() {
    emit(const FileState.loading());
    emit(const FileState.initial());
  }

  void loadFiles(Map<String, FileModel> files) {
    emit(FileState.loaded(files));
  }

  Map<String, FileModel> get files => state.maybeWhen(
        loaded: (files) => files,
        orElse: () => <String, FileModel>{},
      );
}
