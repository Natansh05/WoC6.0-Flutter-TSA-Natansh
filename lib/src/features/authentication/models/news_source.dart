//making source model class
// so that it is easier to parse the json file

class Source{
    String id;
    String name;

    //creating the constructor
    Source({
      required this.id,
      required this.name,
    });

    //creating the factory function to map the json file
    factory Source.fromJson(Map<String,dynamic> json){
      return Source(
        id: json['id'],
        name: json['name'],
      );
    }


}