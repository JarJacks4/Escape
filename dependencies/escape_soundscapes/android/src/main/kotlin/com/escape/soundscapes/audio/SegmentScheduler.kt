package com.escape.soundscapes.audio

import com.escape.soundscapes.model.AudioSegment

/**
 * Play order of a Lucille segment set (SegmentScheduler.swift): intro, then body segments in
 * shuffled order with no segment twice in a row, then the outro when the session ends.
 */
class SegmentScheduler(
    segments: List<AudioSegment>,
    private val shuffle: (List<Int>) -> List<Int> = { it.shuffled() },
) {
    val intro: AudioSegment? = segments.firstOrNull { it.role == AudioSegment.Role.INTRO }
    val bodies: List<AudioSegment> = segments.filter { it.role == AudioSegment.Role.BODY }
    val outro: AudioSegment? = segments.firstOrNull { it.role == AudioSegment.Role.OUTRO }

    private val bag = ArrayDeque<Int>()
    private var lastBody: Int? = null
    private var startedIntro = false

    /** First segment to play: the intro if there is one, otherwise a body. */
    fun first(): AudioSegment? {
        if (intro != null && !startedIntro) {
            startedIntro = true
            return intro
        }
        return nextBody()
    }

    /** Next body segment. Loops forever; never repeats the previous body when there are two or more. */
    fun nextBody(): AudioSegment? {
        if (bodies.isEmpty()) return null
        if (bodies.size == 1) return bodies[0]
        if (bag.isEmpty()) {
            val order = shuffle(bodies.indices.toList()).toMutableList()
            if (order.first() == lastBody) {
                val tmp = order[0]; order[0] = order[order.size - 1]; order[order.size - 1] = tmp
            }
            bag.addAll(order)
        }
        val index = bag.removeFirst()
        lastBody = index
        return bodies[index]
    }
}
