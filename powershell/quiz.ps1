$questions = 
@(
    @{
        Question = "What does a yellow light mean?";
        Rep1 = "Slow down";
        Rep2 = "Speed up";
        Rep3 = "Stop";
        Rep4 = "Stay steady";
        Correct = 1;
    },
    @{
        Question = "Why did the devil go down to Georgia?";
        Rep1 = "To eat a million peaches";
        Rep2 = "To challenge someone to a fiddle battle";
        Rep3 = "To see the sights";
        Rep4 = "He was on a 50 state tour";
        Correct = 2;
    }
)

$attempts = 2
$score = 0
$totalPossible = $questions.Count * $attempts

foreach ($question in $questions) 
{
    $question.Question
    "1: $($question.Rep1)"
    "2: $($question.Rep2)"
    "3: $($question.Rep3)"
    "4: $($question.Rep4)"
    $correct = $false
    $tryCount = $attempts
    do
    {
        if ((Read-Host -Prompt "`nSelect your answer") -eq $question.Correct)
        {
            $correct = $true
            $score += $tryCount
            "Correct! $($tryCount) points awarded"
        }
        else
        {
            $tryCount--
            "Sorry, $($tryCount) tries left"
        }
    }
    while (!$correct -and $tryCount -gt 0)
    ('-') * 60
}

$grade = [Math]::Round(($score / $totalPossible) * 100, 1)
$letter = switch ($grade) 
{
    {$_ -gt 90} { "A"; break }
    {$_ -gt 80} { "B"; break }
    {$_ -gt 70} { "C"; break }
    {$_ -gt 60} { "D"; break }
    default     { "F" }
}

"Quiz complete.  You scored $($score) out of $($totalPossible).  $($grade)%, $($letter)"
