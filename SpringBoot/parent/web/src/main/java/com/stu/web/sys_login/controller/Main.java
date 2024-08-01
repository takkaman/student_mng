import java.util.*;

class Question {
    private String number;
    private String content;
    private String answer;

    private String score;

    private String original;

    private String stuAnswer = "";

    private Integer point = 0;

    // format correct or not
    private boolean isValid = true;

    // question deleted or not
    private boolean existed = true;

    public Question(String number, String content, String answer, String original) {
        this.number = number;
        this.content = content;
        this.answer = answer;
    }

    public Question(String original) {
        this.original = original;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public boolean isValid() {
        return isValid;
    }

    public void setValid(boolean valid) {
        isValid = valid;
    }

    public String getOriginal() {
        return original;
    }

    public void setOriginal(String original) {
        this.original = original;
    }

    public boolean isExisted() {
        return existed;
    }

    public void setExisted(boolean existed) {
        this.existed = existed;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public String getStuAnswer() {
        return stuAnswer;
    }

    public void setStuAnswer(String stuAnswer) {
        this.stuAnswer = stuAnswer;
    }

    public Integer getPoint() {
        return point;
    }

    public void setPoint(Integer point) {
        this.point = point;
    }

    public boolean checkFormat() {
        String[] parts = original.split(" ");

        // unexpected format
        if (parts.length != 3) {
            System.out.println("wrong format:" + original);
            this.isValid = false;
            this.existed = false;
            return false;
        }

        if (!parts[0].startsWith("#N:")) {
            System.out.println("wrong format:" + original);
            this.isValid = false;
            this.existed = false;
            return false;
        }

        if (!parts[2].startsWith("#A:")) {
            System.out.println("wrong format:" + original);
            this.isValid = false;
            this.existed = false;
            return false;
        }
        if (!parts[1].startsWith("#Q:")) {
            System.out.println("wrong format:" + original);
            this.isValid = false;
            this.existed = false;
            return false;
        }

        this.number = parts[0].substring(3);
        this.content = parts[1].substring(3);
        this.answer = parts[2].substring(3);

        return true;
    }
}

class QuestionPoint {

    private String questionId;
    private Integer questionPoint;

    public QuestionPoint(String questionId, Integer questionPoint) {
        this.questionId = questionId;
        this.questionPoint = questionPoint;
    }

    public String getQuestionId() {
        return questionId;
    }

    public void setQuestionId(String questionId) {
        this.questionId = questionId;
    }

    public Integer getQuestionPoint() {
        return questionPoint;
    }

    public void setQuestionPoint(Integer questionPoint) {
        this.questionPoint = questionPoint;
    }
}

class TestPaper {
    private String number;
    private List<QuestionPoint> questionPointList = new ArrayList<>();

    private List<Integer> questionOrder = new ArrayList<>();

    public TestPaper() {

    }

    public TestPaper(String number, List<QuestionPoint> questionPointList) {
        this.number = number;
        this.questionPointList = questionPointList;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public List<QuestionPoint> getQuestionPointList() {
        return questionPointList;
    }

    public void setQuestionPointList(List<QuestionPoint> questionPointList) {
        this.questionPointList = questionPointList;
    }

    public List<Integer> getQuestionOrder() {
        return questionOrder;
    }

    public void setQuestionOrder(List<Integer> questionOrder) {
        this.questionOrder = questionOrder;
    }
}

class Answer {
    private Integer questionOrder;
    private String questionAnswer;

    public Answer(Integer questionOrder, String questionAnswer) {
        this.questionOrder = questionOrder;
        this.questionAnswer = questionAnswer;
    }

    public Integer getQuestionOrder() {
        return questionOrder;
    }

    public void setQuestionOrder(Integer questionOrder) {
        this.questionOrder = questionOrder;
    }

    public String getQuestionAnswer() {
        return questionAnswer;
    }

    public void setQuestionAnswer(String questionAnswer) {
        this.questionAnswer = questionAnswer;
    }
}

class AnswerSheet {
    private String number;
    private List<Answer> answers;

    private Map<String, String> answerMap = new HashMap<>();

    public AnswerSheet(String number, List<Answer> answers) {
        this.number = number;
        this.answers = answers;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public List<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(List<Answer> answers) {
        this.answers = answers;
    }

    public Map<String, String> getAnswerMap() {
        return answerMap;
    }

    public void setAnswerMap(Map<String, String> answerMap) {
        this.answerMap = answerMap;
    }
}

class Student {
    private String studentId;
    private String studentName;
    private AnswerSheet answerSheet;

    public Student(String studentId, String studentName) {
        this.studentId = studentId;
        this.studentName = studentName;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public AnswerSheet getAnswerSheet() {
        return answerSheet;
    }

    public void setAnswerSheet(AnswerSheet answerSheet) {
        this.answerSheet = answerSheet;
    }
}

public class Main {
    public static void main(String[] args) {

        Map<String, Student> studentInfoMap = new HashMap<>();
        Map<String, AnswerSheet> studentAnswerMap = new HashMap<>();

        Scanner scanner = new Scanner(System.in);
        Map<String, Question> questionMap = new HashMap<>();
        Map<String, TestPaper> testPaperMap = new HashMap<>();
        String checkStudentId = "";
        String line;
        List<Integer> questionOrder = new ArrayList<>();
        List<Integer> paperOrder = new ArrayList<>();

        while (!(line = scanner.nextLine()).equals("end")) {
            if (line.startsWith("#N")) {
                String[] parts = line.split(" ");
                String questionId = "";
                if (parts[0].length() <= 3) {
                    System.out.println("wrong format:" + line);
                    continue;
                }
                questionId = parts[0].substring(3);
//                String content = parts[1].substring(3);
//                String answer = parts[2].substring(3);
                Question question = new Question(line);
                questionMap.put(questionId, question);
                questionOrder.add(Integer.parseInt(questionId));

            } else if (line.startsWith("#T")) {
                List<QuestionPoint> questionPointList = new ArrayList<>();
                String[] parts = line.split(" ");
                String testNumber = parts[0].substring(3);
                TestPaper testPaper = new TestPaper();
                for (int i = 1; i < parts.length; i++) {
                    String[] pair = parts[i].split("-");
                    questionPointList.add(new QuestionPoint(pair[0], Integer.parseInt(pair[1])));
                    testPaper.getQuestionOrder().add(Integer.parseInt(pair[0]));
                }
                testPaper.setNumber(testNumber);
                testPaper.setQuestionPointList(questionPointList);
                testPaperMap.put(testNumber, testPaper);
            } else if (line.startsWith("#X")) {
                // 解析学生信息
                String stuInfo = line.substring(3);
                String[] parts = stuInfo.split("-");
                for (String part : parts) {
                    String[] subParts = part.split(" ");
                    if (subParts.length < 2) continue;
                    String studentId = subParts[0];
                    String studentName = subParts[1];
                    studentInfoMap.put(studentId, new Student(studentId, studentName));
                }
            } else if (line.startsWith("#S")) {
                String[] parts = line.split(" ");
                if (parts.length <= 1 || line.length() <= 2) continue;;
                String testNumber = parts[0].substring(3);
                String studentID = parts[1];
                checkStudentId = studentID;
                int questionNum = 1;
                List<Answer> answers = new ArrayList<>();
                for (int i = 2; i < parts.length; i++) {
                    if (parts[i].contains("-")) {
                        String[] subParts = parts[i].substring(3).split("-");
                        if (subParts.length <= 1) {
                            // empty answer
                            answers.add(new Answer(Integer.parseInt(subParts[0]), ""));
                        } else {
                            answers.add(new Answer(Integer.parseInt(subParts[0]), subParts[1]));
                        }
                    } else {
                        // question number not specified in answer sheet
                        String answer = parts[i].substring(3);
                        answers.add(new Answer(questionNum, answer));
                        questionNum++;
                    }
                }
                studentAnswerMap.put(studentID, new AnswerSheet(testNumber, answers));
            } else if (line.startsWith("#D:N-")) {
                String questionId = line.substring(5);
                questionMap.get(questionId).setValid(false);
            } else {
                System.out.println("wrong format:" + line);
            }
        }

        Student checkStudent = studentInfoMap.get(checkStudentId);

        // step: check question format
        Collections.sort(questionOrder);
        for (int i = 0; i < questionOrder.size(); i++) {
            Question question = questionMap.get(String.valueOf(questionOrder.get(i)));
            question.checkFormat();
        }
        // step: check total score
        for (Map.Entry<String, TestPaper> testPaperEntry : testPaperMap.entrySet()) {
            TestPaper testPaper = testPaperEntry.getValue();
            int totalScore = 0;
            for (QuestionPoint questionPoint : testPaper.getQuestionPointList()) {
                totalScore += questionPoint.getQuestionPoint();
            }
            if (totalScore != 100) {
                System.out.println("alert: full score of test paper" + testPaper.getNumber() + " is not 100 points");
            }
        }


        // check answer sheet correctness
        AnswerSheet answerSheet = studentAnswerMap.get(checkStudentId);
        if (answerSheet == null) {
            return;
        }
        int totalCorrectPoints = 0;
        if (!testPaperMap.containsKey(answerSheet.getNumber())) {
            System.out.print("The test paper number does not exist");
            return;
        }

        TestPaper testPaper = testPaperMap.get(answerSheet.getNumber());
        Collections.sort(testPaper.getQuestionOrder());
        StringBuilder answerPointDetail = new StringBuilder();
        for (Answer answer : answerSheet.getAnswers()) {
            if (answer.getQuestionOrder() > testPaper.getQuestionPointList().size()) {
//                System.out.printf("order %d larger than test paper size %d, ignore.\n", answer.getQuestionOrder(), testPaper.getQuestionPointList().size());
                continue;
            }

            QuestionPoint questionPoint = testPaper.getQuestionPointList().get(answer.getQuestionOrder() - 1);
            answerSheet.getAnswerMap().put(questionPoint.getQuestionId(), answer.getQuestionAnswer());
            if (!questionMap.containsKey(questionPoint.getQuestionId())) {
//                System.out.println("non-existent question~0");
//                answerPointDetail.append("0 ");
                continue;
            }

            Question question = questionMap.get(questionPoint.getQuestionId());
            question.setPoint(questionPoint.getQuestionPoint());
        }

        // check student test result


        boolean nullAnswer = false;
        boolean noneExistQ = false;

        for (int i = 0; i < testPaper.getQuestionOrder().size(); i++) {
            String questionId = String.valueOf(testPaper.getQuestionOrder().get(i));

            // check non-existent question: testpaper question not in question list
            if (!questionMap.containsKey(questionId)) {
                    System.out.printf("non-existent question~0\n");

                answerPointDetail.append("0 ");
                noneExistQ = true;
                continue;
            }

            // check non-existent question: question deleted
            Question question = questionMap.get(questionId);
            if (!question.isExisted()) {

                System.out.printf("non-existent question~0\n");

                answerPointDetail.append("0 ");
                noneExistQ = true;
                continue;
            }

            // check answer is null
            if (!answerSheet.getAnswerMap().containsKey(questionId)) {
                System.out.println("answer is null");
                answerPointDetail.append("0 ");
                nullAnswer = true;
                continue;
            }

            if (answerSheet.getAnswerMap().get(questionId).isEmpty()) {
                System.out.println("answer is null");
                answerPointDetail.append("0 ");
                nullAnswer = true;
                continue;
            }

            // check question format
            if (!question.isValid()) {
                System.out.printf("the question %s invalid~0\n", question.getNumber());
                answerPointDetail.append("0 ");
                continue;
            }
            boolean result = false;

            if (Objects.equals(question.getAnswer(), answerSheet.getAnswerMap().get(questionId))) {
                totalCorrectPoints += question.getPoint();
                result = true;
                answerPointDetail.append(question.getPoint()).append(" ");
            } else {
                answerPointDetail.append("0 ");
            }
            System.out.println(question.getContent() + "~" + answerSheet.getAnswerMap().get(questionId) + "~" + result);
        }

        // check non-existent student
        if (!studentInfoMap.containsKey(checkStudentId)) {
            System.out.printf("%s not found", checkStudentId);
            return;
        }


        System.out.printf(checkStudent.getStudentId() + " " + checkStudent.getStudentName() + ": " + answerPointDetail.substring(0, answerPointDetail.length() - 1) + "~" + totalCorrectPoints);
    }
}
