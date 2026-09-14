package com.joker.kit.domain.usecase

import com.joker.kit.domain.model.StreakInfo
import com.joker.kit.domain.repository.GoalRepository
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.combine
import javax.inject.Inject

object MotivationQuotes {
    val quotes = listOf(
        "Action cures fear. Start the first task right now.",
        "You don't need motivation. You need discipline. Execute.",
        "The resistance you feel before starting is your true enemy. Break through it.",
        "Do what must be done, especially when you don't feel like it.",
        "Momentum isn't found. It is forged one completed task at a time.",
        "Small daily disciplines lead to massive lifetime victories.",
        "Procrastination is the thief of potential. Check off the box.",
        "Your future self is either thanking you or blaming you for today.",
        "Amateurs wait for inspiration. Professionals sit down and do the work.",
        "A year from now, you'll wish you had started today.",
        "Discipline is choosing between what you want now and what you want most.",
        "Don't count the days, make the days count.",
        "Focus on the process, not the outcome. Finish this task.",
        "The hard work you're avoiding holds the results you're seeking.",
        "You are what you repeatedly do. Excellence is a habit, not an act.",
        "Kill excuses before they kill your dreams.",
        "Win the morning, win the day. Start with task number one.",
        "Energy flows where attention goes. Direct it toward your agenda.",
        "The only bad workout or work session is the one that didn't happen.",
        "Stop negotiating with yourself. You committed to this goal.",
        "Consistency is the ultimate competitive advantage.",
        "Suffer the pain of discipline or suffer the pain of regret.",
        "Greatness is merely a collection of mundane tasks done consistently well.",
        "Don't let yesterday take up too much of today. Reset and execute.",
        "One completed task beats a thousand great intentions.",
        "Every champion was once a contender who refused to give up.",
        "The secret to getting ahead is getting started.",
        "Success doesn't come from what you do occasionally, but what you do consistently.",
        "Doubt is eliminated by action. Get moving.",
        "You don't have to be extreme, just consistent.",
        "Show up even when the excitement has faded.",
        "Build habits that will carry you when motivation runs dry.",
        "Every rep, every line of code, every page counts.",
        "Be stronger than your strongest excuse.",
        "The score takes care of itself if you execute the fundamentals.",
        "Turn 'one day' into 'day one'. Check your tasks.",
        "Progress requires friction. Embrace the effort.",
        "A goal without daily tasks is just a wish.",
        "Winners focus on winning; losers focus on winners. Focus on your tasks.",
        "Discipline is the bridge between goals and accomplishment.",
        "You didn't wake up today to be mediocre.",
        "Mastering yourself is true power. Stay on track.",
        "The best time to plant a tree was 20 years ago. The second best time is now.",
        "Your habits decide your future. What are you building today?",
        "Do it badly, do it slowly, do it scared, but do it.",
        "Courage is taking action despite the lack of certainty.",
        "Tough times don't last; tough people do. Keep ticking tasks.",
        "Comfort is the enemy of progress. Step outside of it.",
        "Do not stop when you are tired. Stop when you are done.",
        "Work hard in silence; let your streak be your noise.",
        "Motivation gets you going, but discipline keeps you growing.",
        "The master has failed more times than the beginner has even tried.",
        "You cannot change your destination overnight, but you can change your direction today.",
        "Focus is saying no to the hundred other good ideas.",
        "Today's effort is tomorrow's foundation.",
        "Do the difficult tasks first. The rest will follow.",
        "Don't lower your goals; increase your effort.",
        "Action is the foundational key to all success.",
        "When you feel like quitting, remember why you started.",
        "Consistency over intensity. Show up every day.",
        "You are in control of two things: your attitude and your effort.",
        "Great things are done by a series of small things brought together.",
        "No pressure, no diamonds. Face the hard tasks today.",
        "If it doesn't challenge you, it won't change you.",
        "Today is another opportunity to prove your dedication.",
        "Stop overthinking. Start executing.",
        "The best way to predict the future is to create it today.",
        "Every task checked is a vote for the person you want to become.",
        "Excuses make today easy, but tomorrow harder.",
        "Discipline is freedom. Complete the checklist.",
        "Results happen over time, not overnight. Work hard, stay patient.",
        "Your potential is endless. Go do what you were created to do.",
        "Be addicted to bettering yourself every single day.",
        "Failure is not the opposite of success; it's part of it.",
        "Stay hungry. Stay focused. Lock in.",
        "The tragedy of life is not death, but what we let die inside us while we live.",
        "Make each day your masterpiece.",
        "Your only limit is your mind. Overrule it and act.",
        "Dream big, start small, begin now.",
        "Pressure is a privilege. Rise to the occasion.",
        "Nothing will work unless you do.",
        "Act as if what you do makes a difference. It does.",
        "Don't wait for the right moment. Take this moment and make it right.",
        "The pain you feel today will be the strength you feel tomorrow.",
        "Build momentum early. Win the first hour.",
        "Discipline weighs ounces; regret weighs tons.",
        "You don't need easy. You just need possible. Keep grinding.",
        "Take ownership of your day before the day takes ownership of you.",
        "Every action you take is a seed you sow. Reap greatness.",
        "Refuse to be outworked by your yesterday's self.",
        "The clock is ticking. Are you becoming the person you want to be?",
        "Sacrifice what you are for what you could become.",
        "Execute with precision. Leave nothing to chance.",
        "Don't let a bad moment ruin an entire day of productivity.",
        "The only person you should try to be better than is who you were yesterday.",
        "Hard choices, easy life. Easy choices, hard life.",
        "Stop waiting for the mood to strike. Motivation follows motion.",
        "Focus on being productive instead of busy.",
        "Commitment means staying loyal to what you said you would do.",
        "Lock in. Check off today's agenda and conquer the day."
    )

    fun getRandomQuote(): String = quotes.random()
}

class MotivationEngineUseCase @Inject constructor(
    private val getPrimaryGoalUseCase: GetPrimaryGoalUseCase,
    private val calculateStreakUseCase: CalculateStreakUseCase
) {
    /**
     * Returns a motivational string based on streak milestones, goal WHY, or 100 quotes bank.
     */
    operator fun invoke(): Flow<String> {
        return combine(
            getPrimaryGoalUseCase(),
            calculateStreakUseCase()
        ) { goal, streakInfo ->
            val why = goal?.why?.takeIf { it.isNotBlank() }
            when {
                streakInfo.current >= 7 && why != null ->
                    "${streakInfo.current} day streak. $why"
                streakInfo.current >= 7 ->
                    "${streakInfo.current} day streak. Keep going."
                streakInfo.current > 0 && why != null ->
                    "Day ${streakInfo.current}. $why"
                streakInfo.current > 0 ->
                    "Day ${streakInfo.current}. Stay consistent."
                why != null ->
                    why
                else ->
                    MotivationQuotes.getRandomQuote()
            }
        }
    }
}
