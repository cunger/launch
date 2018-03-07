function generateClassRecordSummary(students) {
  const EXAM_WEIGHT = 0.65;
  const EXERCISE_WEIGHT = 0.35;

  function letter(grade) {
    if (grade >= 93) return 'A';
    if (grade >= 85) return 'B';
    if (grade >= 77) return 'C';
    if (grade >= 69) return 'D';
    if (grade >= 60) return 'E';
    return 'F';
  }

  function grade(student) {
    var totalScore = Math.round(
        EXAM_WEIGHT * average(student.scores.exams)
      + EXERCISE_WEIGHT * sum(student.scores.exercises)
    );

    return String(totalScore) + '(' + letter(totalScore) + ')';
  }

  var grades = [];
  var examScores = {};

  values(students).forEach(function (student) {
    grades.push(grade(student));

    student.scores.exams.forEach(function (score, index) {
      pushValue(examScores, index, score);
    });
  });

  return {
    'studentGrades': grades,
    'exams': values(examScores).map(function (scores) {
      return {
        'average': round(average(scores), 1),
        'minimum': Math.min(...scores),
        'maximum': Math.max(...scores),
      }
    }),
  };
}

function sum(array) {
  return array.reduce((sum, array) => sum + array, 0);
}

function average(array) {
  return sum(array) / array.length;
}

function round(number, precision) {
  var factor = Math.pow(10, precision);
  return Math.round(number * factor) / factor;
}
// Source: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/round

function values(object) {
  return Object.keys(object).map(key => object[key]);
}

function pushValue(object, key, value) {
  object[key] = object[key] || [];
  object[key].push(value);
}

//// Example ////

var studentScores = {
  student1: {
    id: 123456789,
    scores: {
      exams: [90, 95, 100, 80],
      exercises: [20, 15, 10, 19, 15],
    },
  },
  student2: {
    id: 123456799,
    scores: {
      exams: [50, 70, 90, 100],
      exercises: [0, 15, 20, 15, 15],
    },
  },
  student3: {
    id: 123457789,
    scores: {
      exams: [88, 87, 88, 89],
      exercises: [10, 20, 10, 19, 18],
    },
  },
  student4: {
    id: 112233445,
    scores: {
      exams: [100, 100, 100, 100],
      exercises: [10, 15, 10, 10, 15],
    },
  },
  student5: {
    id: 112233446,
    scores: {
      exams: [50, 80, 60, 90],
      exercises: [10, 0, 10, 10, 0],
    },
  },
};

console.log(generateClassRecordSummary(studentScores));
// {
//   studentGrades: [ '93 (A)', '81 (C)', '86 (B)', '100 (A)', '69 (D)' ],
//   exams: [
//     { average: 75.6, minimum: 50, maximum: 100 },
//     { average: 86.4, minimum: 70, maximum: 100 },
//     { average: 87.6, minimum: 60, maximum: 100 },
//     { average: 91.8, minimum: 80, maximum: 100 },
//   ],
// }
