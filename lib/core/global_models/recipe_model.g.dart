// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeModelAdapter extends TypeAdapter<RecipeModel> {
  @override
  final int typeId = 1;

  @override
  RecipeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeModel(
      uri: fields[0] as String?,
      label: fields[1] as String?,
      image: fields[2] as String?,
      images: fields[3] as Images?,
      source: fields[4] as String?,
      url: fields[5] as String?,
      shareAs: fields[6] as String?,
      yield: fields[7] as double?,
      dietLabels: (fields[8] as List?)?.cast<String>(),
      healthLabels: (fields[9] as List?)?.cast<String>(),
      cautions: (fields[10] as List?)?.cast<String>(),
      ingredientLines: (fields[11] as List?)?.cast<String>(),
      ingredients: (fields[12] as List?)?.cast<Ingredients>(),
      calories: fields[13] as double?,
      totalWeight: fields[14] as double?,
      totalTime: fields[15] as double?,
      cuisineType: (fields[16] as List?)?.cast<String>(),
      mealType: (fields[17] as List?)?.cast<String>(),
      dishType: (fields[18] as List?)?.cast<String>(),
      totalNutrients: fields[19] as TotalNutrients?,
      totalDaily: fields[20] as TotalDaily?,
      digest: (fields[21] as List?)?.cast<Digest>(),
    );
  }

  @override
  void write(BinaryWriter writer, RecipeModel obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.uri)
      ..writeByte(1)
      ..write(obj.label)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.images)
      ..writeByte(4)
      ..write(obj.source)
      ..writeByte(5)
      ..write(obj.url)
      ..writeByte(6)
      ..write(obj.shareAs)
      ..writeByte(7)
      ..write(obj.yield)
      ..writeByte(8)
      ..write(obj.dietLabels)
      ..writeByte(9)
      ..write(obj.healthLabels)
      ..writeByte(10)
      ..write(obj.cautions)
      ..writeByte(11)
      ..write(obj.ingredientLines)
      ..writeByte(12)
      ..write(obj.ingredients)
      ..writeByte(13)
      ..write(obj.calories)
      ..writeByte(14)
      ..write(obj.totalWeight)
      ..writeByte(15)
      ..write(obj.totalTime)
      ..writeByte(16)
      ..write(obj.cuisineType)
      ..writeByte(17)
      ..write(obj.mealType)
      ..writeByte(18)
      ..write(obj.dishType)
      ..writeByte(19)
      ..write(obj.totalNutrients)
      ..writeByte(20)
      ..write(obj.totalDaily)
      ..writeByte(21)
      ..write(obj.digest);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ImagesAdapter extends TypeAdapter<Images> {
  @override
  final int typeId = 2;

  @override
  Images read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Images(
      tHUMBNAIL: fields[0] as THUMBNAIL?,
      sMALL: fields[1] as THUMBNAIL?,
      rEGULAR: fields[2] as THUMBNAIL?,
      lARGE: fields[3] as THUMBNAIL?,
    );
  }

  @override
  void write(BinaryWriter writer, Images obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.tHUMBNAIL)
      ..writeByte(1)
      ..write(obj.sMALL)
      ..writeByte(2)
      ..write(obj.rEGULAR)
      ..writeByte(3)
      ..write(obj.lARGE);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImagesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class THUMBNAILAdapter extends TypeAdapter<THUMBNAIL> {
  @override
  final int typeId = 3;

  @override
  THUMBNAIL read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return THUMBNAIL(
      url: fields[0] as String?,
      width: fields[1] as int?,
      height: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, THUMBNAIL obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.width)
      ..writeByte(2)
      ..write(obj.height);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is THUMBNAILAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class IngredientsAdapter extends TypeAdapter<Ingredients> {
  @override
  final int typeId = 4;

  @override
  Ingredients read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ingredients(
      text: fields[0] as String?,
      quantity: fields[1] as double?,
      measure: fields[2] as String?,
      food: fields[3] as String?,
      weight: fields[4] as double?,
      foodCategory: fields[5] as String?,
      foodId: fields[6] as String?,
      image: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Ingredients obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.measure)
      ..writeByte(3)
      ..write(obj.food)
      ..writeByte(4)
      ..write(obj.weight)
      ..writeByte(5)
      ..write(obj.foodCategory)
      ..writeByte(6)
      ..write(obj.foodId)
      ..writeByte(7)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IngredientsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TotalNutrientsAdapter extends TypeAdapter<TotalNutrients> {
  @override
  final int typeId = 5;

  @override
  TotalNutrients read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TotalNutrients(
      eNERCKCAL: fields[0] as ENERCKCAL?,
      fAT: fields[1] as ENERCKCAL?,
      fASAT: fields[2] as ENERCKCAL?,
      fATRN: fields[3] as ENERCKCAL?,
      fAMS: fields[4] as ENERCKCAL?,
      fAPU: fields[5] as ENERCKCAL?,
      cHOCDF: fields[6] as ENERCKCAL?,
      cHOCDFNet: fields[7] as ENERCKCAL?,
      fIBTG: fields[8] as ENERCKCAL?,
      sUGAR: fields[9] as ENERCKCAL?,
      sUGARAdded: fields[10] as SUGARAdded?,
      pROCNT: fields[11] as ENERCKCAL?,
      cHOLE: fields[12] as ENERCKCAL?,
      nA: fields[13] as ENERCKCAL?,
      cA: fields[14] as ENERCKCAL?,
      mG: fields[15] as ENERCKCAL?,
      k: fields[16] as ENERCKCAL?,
      fE: fields[17] as ENERCKCAL?,
      zN: fields[18] as ENERCKCAL?,
      p: fields[19] as ENERCKCAL?,
      vITARAE: fields[20] as ENERCKCAL?,
      vITC: fields[21] as ENERCKCAL?,
      tHIA: fields[22] as ENERCKCAL?,
      rIBF: fields[23] as ENERCKCAL?,
      nIA: fields[24] as ENERCKCAL?,
      vITB6A: fields[25] as ENERCKCAL?,
      fOLDFE: fields[26] as ENERCKCAL?,
      fOLFD: fields[27] as ENERCKCAL?,
      fOLAC: fields[28] as SUGARAdded?,
      vITB12: fields[29] as ENERCKCAL?,
      vITD: fields[30] as ENERCKCAL?,
      tOCPHA: fields[31] as ENERCKCAL?,
      vITK1: fields[32] as ENERCKCAL?,
      sugarAlcohol: fields[33] as SUGARAdded?,
      wATER: fields[34] as ENERCKCAL?,
    );
  }

  @override
  void write(BinaryWriter writer, TotalNutrients obj) {
    writer
      ..writeByte(35)
      ..writeByte(0)
      ..write(obj.eNERCKCAL)
      ..writeByte(1)
      ..write(obj.fAT)
      ..writeByte(2)
      ..write(obj.fASAT)
      ..writeByte(3)
      ..write(obj.fATRN)
      ..writeByte(4)
      ..write(obj.fAMS)
      ..writeByte(5)
      ..write(obj.fAPU)
      ..writeByte(6)
      ..write(obj.cHOCDF)
      ..writeByte(7)
      ..write(obj.cHOCDFNet)
      ..writeByte(8)
      ..write(obj.fIBTG)
      ..writeByte(9)
      ..write(obj.sUGAR)
      ..writeByte(10)
      ..write(obj.sUGARAdded)
      ..writeByte(11)
      ..write(obj.pROCNT)
      ..writeByte(12)
      ..write(obj.cHOLE)
      ..writeByte(13)
      ..write(obj.nA)
      ..writeByte(14)
      ..write(obj.cA)
      ..writeByte(15)
      ..write(obj.mG)
      ..writeByte(16)
      ..write(obj.k)
      ..writeByte(17)
      ..write(obj.fE)
      ..writeByte(18)
      ..write(obj.zN)
      ..writeByte(19)
      ..write(obj.p)
      ..writeByte(20)
      ..write(obj.vITARAE)
      ..writeByte(21)
      ..write(obj.vITC)
      ..writeByte(22)
      ..write(obj.tHIA)
      ..writeByte(23)
      ..write(obj.rIBF)
      ..writeByte(24)
      ..write(obj.nIA)
      ..writeByte(25)
      ..write(obj.vITB6A)
      ..writeByte(26)
      ..write(obj.fOLDFE)
      ..writeByte(27)
      ..write(obj.fOLFD)
      ..writeByte(28)
      ..write(obj.fOLAC)
      ..writeByte(29)
      ..write(obj.vITB12)
      ..writeByte(30)
      ..write(obj.vITD)
      ..writeByte(31)
      ..write(obj.tOCPHA)
      ..writeByte(32)
      ..write(obj.vITK1)
      ..writeByte(33)
      ..write(obj.sugarAlcohol)
      ..writeByte(34)
      ..write(obj.wATER);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TotalNutrientsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ENERCKCALAdapter extends TypeAdapter<ENERCKCAL> {
  @override
  final int typeId = 6;

  @override
  ENERCKCAL read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ENERCKCAL(
      label: fields[0] as String?,
      quantity: fields[1] as double?,
      unit: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ENERCKCAL obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.label)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.unit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ENERCKCALAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SUGARAddedAdapter extends TypeAdapter<SUGARAdded> {
  @override
  final int typeId = 7;

  @override
  SUGARAdded read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SUGARAdded(
      label: fields[0] as String?,
      quantity: fields[1] as double?,
      unit: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SUGARAdded obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.label)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.unit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SUGARAddedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TotalDailyAdapter extends TypeAdapter<TotalDaily> {
  @override
  final int typeId = 8;

  @override
  TotalDaily read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TotalDaily(
      eNERCKCAL: fields[0] as ENERCKCAL?,
      fAT: fields[1] as ENERCKCAL?,
      fASAT: fields[2] as ENERCKCAL?,
      cHOCDF: fields[3] as ENERCKCAL?,
      fIBTG: fields[4] as ENERCKCAL?,
      pROCNT: fields[5] as ENERCKCAL?,
      cHOLE: fields[6] as ENERCKCAL?,
      nA: fields[7] as ENERCKCAL?,
      cA: fields[8] as ENERCKCAL?,
      mG: fields[9] as ENERCKCAL?,
      k: fields[10] as ENERCKCAL?,
      fE: fields[11] as ENERCKCAL?,
      zN: fields[12] as ENERCKCAL?,
      p: fields[13] as ENERCKCAL?,
      vITARAE: fields[14] as ENERCKCAL?,
      vITC: fields[15] as ENERCKCAL?,
      tHIA: fields[16] as ENERCKCAL?,
      rIBF: fields[17] as ENERCKCAL?,
      nIA: fields[18] as ENERCKCAL?,
      vITB6A: fields[19] as ENERCKCAL?,
      fOLDFE: fields[20] as ENERCKCAL?,
      vITB12: fields[21] as ENERCKCAL?,
      vITD: fields[22] as ENERCKCAL?,
      tOCPHA: fields[23] as ENERCKCAL?,
      vITK1: fields[24] as ENERCKCAL?,
    );
  }

  @override
  void write(BinaryWriter writer, TotalDaily obj) {
    writer
      ..writeByte(25)
      ..writeByte(0)
      ..write(obj.eNERCKCAL)
      ..writeByte(1)
      ..write(obj.fAT)
      ..writeByte(2)
      ..write(obj.fASAT)
      ..writeByte(3)
      ..write(obj.cHOCDF)
      ..writeByte(4)
      ..write(obj.fIBTG)
      ..writeByte(5)
      ..write(obj.pROCNT)
      ..writeByte(6)
      ..write(obj.cHOLE)
      ..writeByte(7)
      ..write(obj.nA)
      ..writeByte(8)
      ..write(obj.cA)
      ..writeByte(9)
      ..write(obj.mG)
      ..writeByte(10)
      ..write(obj.k)
      ..writeByte(11)
      ..write(obj.fE)
      ..writeByte(12)
      ..write(obj.zN)
      ..writeByte(13)
      ..write(obj.p)
      ..writeByte(14)
      ..write(obj.vITARAE)
      ..writeByte(15)
      ..write(obj.vITC)
      ..writeByte(16)
      ..write(obj.tHIA)
      ..writeByte(17)
      ..write(obj.rIBF)
      ..writeByte(18)
      ..write(obj.nIA)
      ..writeByte(19)
      ..write(obj.vITB6A)
      ..writeByte(20)
      ..write(obj.fOLDFE)
      ..writeByte(21)
      ..write(obj.vITB12)
      ..writeByte(22)
      ..write(obj.vITD)
      ..writeByte(23)
      ..write(obj.tOCPHA)
      ..writeByte(24)
      ..write(obj.vITK1);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TotalDailyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DigestAdapter extends TypeAdapter<Digest> {
  @override
  final int typeId = 9;

  @override
  Digest read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Digest(
      label: fields[0] as String?,
      tag: fields[1] as String?,
      schemaOrgTag: fields[2] as String?,
      total: fields[3] as double?,
      hasRDI: fields[4] as bool?,
      daily: fields[5] as double?,
      unit: fields[6] as String?,
      sub: (fields[7] as List?)?.cast<Sub>(),
    );
  }

  @override
  void write(BinaryWriter writer, Digest obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.label)
      ..writeByte(1)
      ..write(obj.tag)
      ..writeByte(2)
      ..write(obj.schemaOrgTag)
      ..writeByte(3)
      ..write(obj.total)
      ..writeByte(4)
      ..write(obj.hasRDI)
      ..writeByte(5)
      ..write(obj.daily)
      ..writeByte(6)
      ..write(obj.unit)
      ..writeByte(7)
      ..write(obj.sub);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DigestAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubAdapter extends TypeAdapter<Sub> {
  @override
  final int typeId = 10;

  @override
  Sub read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sub(
      label: fields[0] as String?,
      tag: fields[1] as String?,
      schemaOrgTag: fields[2] as String?,
      total: fields[3] as double?,
      hasRDI: fields[4] as bool?,
      daily: fields[5] as double?,
      unit: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Sub obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.label)
      ..writeByte(1)
      ..write(obj.tag)
      ..writeByte(2)
      ..write(obj.schemaOrgTag)
      ..writeByte(3)
      ..write(obj.total)
      ..writeByte(4)
      ..write(obj.hasRDI)
      ..writeByte(5)
      ..write(obj.daily)
      ..writeByte(6)
      ..write(obj.unit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
