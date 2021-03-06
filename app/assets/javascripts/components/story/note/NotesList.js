import React from 'react';
import Note from './Note';
import PropTypes from 'prop-types';

const NotesList = ({ notes, onDelete }) => (
  <div>
    {
      notes.map(note => (
        <Note
          key={note.id}
          note={note}
          onDelete={() => onDelete(note.id)}
        />
      ))
    }
  </div>
);

NotesList.propTypes = {
  notes: PropTypes.arrayOf(PropTypes.object).isRequired,
  onDelete: PropTypes.func.isRequired
};

export default NotesList;
