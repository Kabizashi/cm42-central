import actionTypes from 'actions/actionTypes';
import { toggleStory, editStory, updateStory } from 'models/beta/story'
import * as Note from 'models/beta/note';
import { updateIfSameId } from '../services/updateIfSameId';
import * as Task from 'models/beta/task';

const initialState = [];

const storiesReducer = (state = initialState, action) => {
  switch (action.type) {
    case actionTypes.RECEIVE_STORIES:
      return action.data;
    case actionTypes.TOGGLE_STORY:
      return state.map(
        updateIfSameId(action.id, toggleStory));
    case actionTypes.EDIT_STORY:
      return state.map(
        updateIfSameId(action.id, (story) => {
          return editStory(story, action.newAttributes);
        }));
    case actionTypes.UPDATE_STORY_SUCCESS:
      return state.map(
        updateIfSameId(action.story.id, (story) => {
          return updateStory(story, action.story);
        }));
    case actionTypes.ADD_TASK:
      return state.map(
        updateIfSameId(action.storyId, (story) => {
          return Task.addTask(story, action.task);
        }));
    case actionTypes.REMOVE_TASK:
      return state.map(
        updateIfSameId(action.storyId, (story) => {
          return Task.deleteTask(action.task, story);
        }));
    case actionTypes.TOGGLE_TASK:
      return state.map(
        updateIfSameId(action.story.id, (story) => {
          return Task.toggleTask(story, action.task);
        }));
    case actionTypes.DELETE_STORY_SUCCESS:
      return state.filter(
        story => story.id !== action.id
      );
    case actionTypes.ADD_NOTE:
      return state.map(
        updateIfSameId(action.storyId, (story) => {
          return Note.addNote(story, action.note)
        }));
    case actionTypes.DELETE_NOTE:
      return state.map(
        updateIfSameId(action.storyId, (story) => {
          return Note.deleteNote(story, action.noteId)
        }));
    case actionTypes.ADD_TASK:
      return state.map(
        updateIfSameId(action.story.id, (story) => {
          return Task.addTask(story, action.task);
        }));
    case actionTypes.REMOVE_TASK:
      return state.map(
        updateIfSameId(action.story.id, (story) => {
          return Task.deleteTask(action.task, story);
        }));
    case actionTypes.UPDATE_TASK:
      return state.map(
        updateIfSameId(action.story.id, (story) => {
          return Task.updateTask(story, action.task);
        }));
    default:
      return state;
  };
};

export default storiesReducer;
