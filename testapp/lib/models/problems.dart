class ProblemsModel{
  final String problem;
  final String status;
  final String date;

  ProblemsModel({this.problem, this.status, this.date});
}

List<ProblemsModel> dummyData = [
  new ProblemsModel(
    problem: "Lorem ipsum dolor sit amet...",
    status: "SENT",
    date: "12/22/2019",
  ),
  new ProblemsModel(
    problem: "Lorem ipsum dolor sit amet...",
    status: "RESOLVED",
    date: "12/22/2019",
  ),
  new ProblemsModel(
    problem: "Lorem ipsum dolor sit amet...",
    status: "RESOLVED",
    date: "12/22/2019",
  ),
];